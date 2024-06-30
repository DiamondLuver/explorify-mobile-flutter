from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework.permissions import BasePermission, IsAuthenticated, AllowAny
from .models import *
from .serializers import *
from rest_framework.decorators import permission_classes, api_view
from rest_framework import generics, status
from base.utils import StandardResultsSetPagination, success_response, error_response     # customized in base app
from django.shortcuts import get_object_or_404

class IsAdminUser(BasePermission):
    def has_permission(request):
        return (
            request.user
            and request.user.is_authenticated
            and request.user.role.role_id < 3
        )


""" 
FOR POST LIST, CREATE, DETAIL, UPDATE, DELETE
"""


@api_view(["GET", "POST"])
def post_list_create(request):
    if request.method == "GET":
        paginator = StandardResultsSetPagination()
        posts = Post.objects.all()
        result_page = paginator.paginate_queryset(posts, request)
        serializer = PostSerializer(result_page, many=True)
        return paginator.get_paginated_response(serializer.data)
    elif request.method == "POST":
        if not IsAdminUser.has_permission(request):
            return error_response(message="Forbidden", status_code=403)
        serializer = PostDetailSerializer(data=request.data)

        if serializer.is_valid():
            serializer.save()
            return success_response(
                message="Create successfully",
                data=serializer.data,
                status_code=status.HTTP_201_CREATED,
            )
        return error_response(
            message=serializer.errors, status_code=status.HTTP_400_BAD_REQUEST
        )


@api_view(["GET", "PUT", "DELETE"])
def post_detail(request, pk=None):
    if request.method == "GET":
        post = get_object_or_404(Post, pk=pk)
        serializer = PostDetailSerializer(post)
        return success_response(
            message="Get data successfully",
            data=serializer.data,
            status_code=status.HTTP_200_OK,
        )
    elif request.method == "PUT":
        if not IsAdminUser.has_permission(request):
            return error_response(message="Forbidden", status_code=403)
        post = get_object_or_404(Post, pk=pk)
        serializer = PostDetailSerializer(post, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return success_response(
                message="Update successfully",
                data=serializer.data,
                status_code=status.HTTP_200_OK,
            )
        return error_response(
            message=serializer.errors, status_code=status.HTTP_400_BAD_REQUEST
        )
    elif request.method == "DELETE":
        if not IsAdminUser.has_permission(request):
            return error_response(message="Forbidden", status_code=403)
        post = get_object_or_404(Post, pk=pk)
        post.delete()
        return success_response(
            message="Delete successfully", status_code=status.HTTP_204_NO_CONTENT
        )


""" 
FOR COMMENT LIST, CREATE BASED ON POST ID
Parameters: Query 'content_type_name', 'object_id'
"""


@api_view(["GET", "POST"])
@permission_classes([AllowAny])
def comment_list_create(request):
    content_type_name = request.query_params.get("content_type_name")
    object_id = request.query_params.get("object_id")
    if not content_type_name or not object_id:
        return error_response(
            message="Invalid content type",
            status_code=status.HTTP_400_BAD_REQUEST,
        )

    content_type = get_object_or_404(ContentType, model=content_type_name.lower())
    if request.method == "GET":
        paginator = StandardResultsSetPagination()
        comments = Comment.objects.filter(
            content_type=content_type, object_id=object_id
        )

        result_page = paginator.paginate_queryset(comments, request)
        serializer = CommentListSerializer(result_page, many=True)
        return paginator.get_paginated_response(serializer.data)

    elif request.method == "POST":
        if not request.user.is_authenticated:
            return error_response(
                message="Unauthorized", status_code=status.HTTP_401_UNAUTHORIZED
            )
        serializer = CommentCreateSerializer(
            data=request.data, context={"request": request}
        )
        if serializer.is_valid():
            serializer.save(
                content_type=content_type,
                object_id=object_id,
                content=serializer.validated_data["content"],
            )
            return success_response(
                message="Create successfully",
                data=serializer.data,
                status_code=status.HTTP_201_CREATED,
            )
        return error_response(
            message=serializer.errors, status_code=status.HTTP_400_BAD_REQUEST
        )


"""
This API endpoint allows users to list and create replies based on a comment.

Parameters:
- `comment_id` (str): The ID of the comment to which the reply is related.
- `request` (Request): The HTTP request object containing the data to be processed.

If the request method is GET, this endpoint returns a paginated list of replies related to the specified comment.
If the request method is POST, this endpoint allows users to create a new reply.

Returns:
- `Response`: A JSON response containing the list of replies or a success/error message.

"""


@api_view(["GET", "POST"])
@permission_classes([AllowAny])
def reply_list_create(request):
    comment_id = request.query_params.get("comment")
    if not comment_id:
        return error_response(
            message="Comment is required",
            status_code=status.HTTP_400_BAD_REQUEST,
        )
    comment = get_object_or_404(Comment, pk=comment_id)

    if request.method == "GET":
        paginator = StandardResultsSetPagination()
        replies = Reply.objects.filter(
            comment=comment,
        )

        result_page = paginator.paginate_queryset(replies, request)
        serializer = ReplySerializer(result_page, many=True)
        return paginator.get_paginated_response(serializer.data)

    elif request.method == "POST":
        if not request.user.is_authenticated:
            return error_response(
                message="Unauthorized", status_code=status.HTTP_401_UNAUTHORIZED
            )
        serializer = ReplyCreateSerializer(
            data=request.data, context={"request": request}
        )
        if serializer.is_valid():
            serializer.save(
                comment=comment,
                content=serializer.validated_data["content"],
            )
            return success_response(
                message="Create successfully",
                data=serializer.data,
                status_code=status.HTTP_201_CREATED,
            )
        return error_response(
            message=serializer.errors, status_code=status.HTTP_400_BAD_REQUEST
        )


@api_view(["GET", "POST"])
@permission_classes([AllowAny])
def favorite_list_create(request):
    content_type_name = request.query_params.get("content_type_name")
    object_id = request.query_params.get("object_id")
    if not content_type_name or not object_id:
        return error_response(
            message="Invalid content type (Post, or Internship Post)",
            status_code=status.HTTP_400_BAD_REQUEST,
        )

    content_type = get_object_or_404(ContentType, model=content_type_name.lower())
    if request.method == "GET":
        paginator = StandardResultsSetPagination()
        favorites = Favorite.objects.filter(
            content_type=content_type, object_id=object_id, active=True
        )

        result_page = paginator.paginate_queryset(favorites, request)
        serializer = FavoriteSerializer(result_page, many=True)
        return paginator.get_paginated_response(serializer.data)

    elif request.method == "POST":
        if not request.user.is_authenticated:
            return error_response(
                message="Unauthorized", status_code=status.HTTP_401_UNAUTHORIZED
            )
        # Check if the favorite already exists
        favorite = Favorite.objects.filter(
            content_type=content_type, object_id=object_id, user=request.user
        ).first()
        if favorite:
            # If it exists, update the active field to True
            favorite.active = True
            favorite.save()
            return success_response(
                message="Create successfully",
                data=FavoriteCreateSerializer(favorite).data,
                status_code=status.HTTP_200_OK,
            )
        else:
            serializer = FavoriteCreateSerializer(
                data=request.data, context={"request": request}
            )
            if serializer.is_valid():
                serializer.save(
                    content_type=content_type,
                    object_id=object_id,
                )
                return success_response(
                    message="Create successfully",
                    data=serializer.data,
                    status_code=status.HTTP_201_CREATED,
                )
            return error_response(
                message=serializer.errors, status_code=status.HTTP_400_BAD_REQUEST
            )


"""
Deactivate Favorite Post Internship or Article Post.
REQUIRED: POST PARAMETER:
- pk: The ID of the favorite to be deleted.

Parameters:
- request: The HTTP request object containing the data to be processed.
- pk: The ID of the favorite to be deleted.

"""


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def favorite_delete(request, pk):
    favorite = get_object_or_404(Favorite, favorite_id=pk)
    if favorite.user == request.user:
        favorite.active = 0
        favorite.save()
        return success_response(
            message="Favorite deleted successfully",
            status_code=status.HTTP_204_NO_CONTENT,
        )
    else:
        return error_response(
            message="Unauthorized", status_code=status.HTTP_401_UNAUTHORIZED
        )
