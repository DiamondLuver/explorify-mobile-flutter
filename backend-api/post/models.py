from django.db import models
from account.models import User
from django.utils.translation import gettext as _
from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.contenttypes.models import ContentType
from django.utils.text import slugify
import string, random


def random_slug():
    """
    Generates a unique slug of 8 characters long, composed of alphanumeric characters.

    Returns:
    str: A unique 8-character slug composed of alphanumeric characters.
    """
    allowed_chars = "".join((string.ascii_letters, string.digits))
    unique_slug = "".join(random.choice(allowed_chars) for _ in range(8))
    return unique_slug


# Tag Model
class Tag(models.Model):
    name = models.CharField(max_length=50, unique=True)

    class Meta:
        verbose_name = _("Tag")
        verbose_name_plural = _("Tags")
        db_table = _("tag")

    def __str__(self):
        return self.name


# Post model
class Post(models.Model):
    post_id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=255)
    content = models.TextField()
    author = models.ForeignKey(User, on_delete=models.CASCADE, default=None, null=True)
    tags = models.ManyToManyField("Tag", blank=True)
    slug = models.SlugField(unique=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def save(self, *args, **kwargs): 
        if not self.slug:
            self.slug = slugify(self.title + " " + random_slug())
        return super().save(*args, **kwargs)

    class Meta:
        verbose_name = _("Post")
        verbose_name_plural = _("Posts")
        db_table = _("post")

    def __str__(self):
        return self.title

# COMMENT MODEL
class Comment(models.Model):
    comment_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    content_type = models.ForeignKey(
        ContentType,
        limit_choices_to=models.Q(app_label="post", model="post")
        | models.Q(app_label="internship", model="internshippost"),
        on_delete=models.CASCADE,
    )
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey("content_type", "object_id")
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    active = models.BooleanField(default=True)

    class Meta:
        ordering = ["created_at"]
        verbose_name = _("Comment")
        verbose_name_plural = _("Comments")
        db_table = _("comment")

    def __str__(self):
        return f"Comment {self.content} by {self.user}"


# REPLY MODEL
class Reply(models.Model):
    reply_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    comment = models.ForeignKey(
        Comment, on_delete=models.CASCADE, related_name="replies"
    )
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    active = models.BooleanField(default=True)

    def __str__(self):
        return f"Reply {self.content} by {self.user}"

    class Meta:
        verbose_name = _("Reply")
        verbose_name_plural = _("Replies")
        db_table = _("reply")


# FAVORITE MODEL
class Favorite(models.Model):
    favorite_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    content_type = models.ForeignKey(
        ContentType,
        limit_choices_to=models.Q(app_label="post", model="post")
        | models.Q(app_label="internship", model="internshippost"),
        on_delete=models.CASCADE,
    )
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey("content_type", "object_id")
    created_at = models.DateTimeField(auto_now_add=True)
    active = models.BooleanField(default=True)

    def __str__(self):
        return f"Favorite {self.content_object} by {self.user}"

    class Meta:
        unique_together = ("user", "content_type", "object_id")
        verbose_name = _("Favorite")
        verbose_name_plural = _("Favorites")
        db_table = "favorite"
