from rest_framework import serializers
from .models import *
from account.serializers import UsersSerializer


class PostSerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        fields = "__all__"


class PostDetailSerializer(serializers.ModelSerializer):
    slug = serializers.SlugField(required=False)

    class Meta:
        model = Post
        fields = "__all__"


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
        comment = Comment.objects.create(user=user, active=1, **validated_data)
        return comment
