from rest_framework import serializers
from .models import *
from account.serializers import UsersSerializer
from django.utils import timezone

class PostSerializer(serializers.ModelSerializer):
    author = UsersSerializer()
    class Meta:
        model = Post
        fields = "__all__"
    


class PostDetailSerializer(serializers.ModelSerializer):
    slug = serializers.SlugField(required=False)
    author = UsersSerializer(required=False)
    class Meta:
        model = Post
        fields = "__all__"
    def create(self, validated_data):
        user = self.context["request"].user
        post = Post.objects.create(author=user, **validated_data)
        return post


class CommentSerializer(serializers.ModelSerializer):
    content_type = serializers.PrimaryKeyRelatedField(
        queryset=ContentType.objects.filter(
            models.Q(app_label="post", model="post")
            | models.Q(app_label="internship", model="internshippost")
        )
    )
    user = UsersSerializer(required=False)

    class Meta:
        model = Comment
        fields = "__all__"


class CommentCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = ["comment_id", "content", "created_at"]
        read_only_fields = ["created_at"]

    def create(self, validated_data):
        user = self.context["request"].user
        comment = Comment.objects.create(user=user, active=1, **validated_data)
        return comment


class ReplySerializer(serializers.ModelSerializer):
    class Meta:
        model = Reply
        fields = "__all__"


class ReplyCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Reply
        fields = ["reply_id", "content", "created_at"]
        read_only_fields = ["created_at"]

    def create(self, validated_data):
        user = self.context["request"].user
        reply = Reply.objects.create(user=user, active=1, **validated_data)
        return reply


class CommentListSerializer(serializers.ModelSerializer):
    replies = ReplySerializer(many=True, read_only=True)

    class Meta:
        model = Comment
        fields = [
            "comment_id",
            "user",
            "content_type",
            "object_id",
            "content",
            "created_at",
            "active",
            "replies",
        ]
        read_only_fields = ["created_at", "active"]


class FavoriteSerializer(serializers.ModelSerializer):
    content_type = serializers.PrimaryKeyRelatedField(
        queryset=ContentType.objects.filter(
            models.Q(app_label="post", model="post")
            | models.Q(app_label="internship", model="internshippost")
        )
    )

    class Meta:
        model = Favorite
        fields = "__all__"


class FavoriteCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Favorite
        fields = ["favorite_id", "created_at"]
        read_only_fields = ["created_at"]

    def create(self, validated_data):
        user = self.context["request"].user
        favorite = Favorite.objects.create(user=user, active=1, **validated_data)
        return favorite


class TagsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tag
        fields = "__all__"


from account.serializers import UsersSerializer
from internship.models import InternshipPost
from PIL import Image as PILImage
import io
from django.core.files.base import ContentFile
class UsernameOnlySerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['username']
class InternshipPostSerializer(serializers.ModelSerializer):
    user = UsernameOnlySerializer(required=False)
    tags = TagsSerializer(many=True, read_only=True)
    deadline = serializers.DateField(required=False)
    thumbnails = serializers.ImageField(required=False)

    class Meta:
        model = InternshipPost
        fields = "__all__"

    def create(self, validated_data):
        user = self.context["request"].user
        
        # Compress image if it exceeds 2MB
        if 'thumbnails' in validated_data:
            validated_data['thumbnails'] = self.compress_image(validated_data['thumbnails'])

        post = InternshipPost.objects.create(user=user, **validated_data)
        return post

    def validate_thumbnails(self, value):
        # Validate file extension
        ext = value.name.split('.')[-1].lower()
        if ext not in ['jpg', 'jpeg', 'png', 'gif']:
            raise serializers.ValidationError('Unsupported file extension.')

        # Validate file size
        limit_mb = 2  # 2MB
        if value.size > limit_mb * 1024 * 1024:
            raise serializers.ValidationError('File size exceeds 2 MB limit.')

        return value

    def compress_image(self, image):
        img = PILImage.open(image)
        img = img.convert('RGB')  # Convert to RGB if necessary

        # Resize image
        img.thumbnail((800, 800))  # Resize to 800x800 max

        # Save to a bytes buffer
        img_io = io.BytesIO()
        img.save(img_io, format='JPEG', quality=85)  # Adjust quality as needed
        img_io.seek(0)

        return ContentFile(img_io.read(), name=image.name)