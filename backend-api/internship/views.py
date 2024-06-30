from rest_framework.decorators import api_view

from internship.models import CompanyProfile, InternshipPost
from internship.serializers import CompanyProfileSerializer, InternshipPostSerialzer

# For CompanyProfile CRUD operation 

from rest_framework import serializers
from rest_framework import status 
from rest_framework.response import Response


@api_view(['GET'])
def view_company(request):
     # checking for the parameters from the URL
    if request.query_params:
        company = CompanyProfile.objects.filter(**request.query_params.dict())
    else:
        company = CompanyProfile.objects.all()
 
    # if there is something in items else raise error
    if company:
        serializer = CompanyProfileSerializer(company, many=True)
        return Response(serializer.data)
    else:
        return Response(status=status.HTTP_404_NOT_FOUND)

@api_view(['GET'])
def view_details(request, companyId=None):
    try:
        if companyId is not None:
            company = CompanyProfile.objects.get(pk=companyId)
            serializer = CompanyProfileSerializer(company)
            return Response(serializer.data)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)
    except CompanyProfile.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND) 


@api_view(['POST'])
def add_company(request):
    company_serializer = CompanyProfileSerializer(data=request.data)

    if company_serializer.is_valid():
        company_serializer.save()
        return Response(company_serializer.data, status=status.HTTP_201_CREATED)
    else:
        return Response(company_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['PUT'])
def update_company(request, companyId):
    try:
        company = CompanyProfile.objects.get(pk=companyId)
    except CompanyProfile.DoesNotExist:
        return Response({'error': 'Company not found'}, status=status.HTTP_404_NOT_FOUND)

    company_serializer = CompanyProfileSerializer(company, data=request.data)
    if company_serializer.is_valid():
        company_serializer.save()
        return Response(company_serializer.data)
    else:
        return Response(company_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['DELETE'])
def delete_company(request, companyId):
    try:
        company = CompanyProfile.objects.get(pk=companyId)
    except CompanyProfile.DoesNotExist:
        return Response({'error': 'Company not found'}, status=status.HTTP_404_NOT_FOUND)

    company.delete()
    return Response(status=status.HTTP_204_NO_CONTENT)



# CRUD operation fo InternshipPost 
@api_view(['GET'])
def view_post(request):
     # checking for the parameters from the URL
    if request.query_params:
        post = InternshipPost.objects.filter(**request.query_params.dict())
    else:
        post = InternshipPost.objects.all()
 
    # if there is something in items else raise error
    if post:
        serializer = InternshipPostSerialzer(post, many=True)
        return Response(serializer.data)
    else:
        return Response(status=status.HTTP_404_NOT_FOUND)

@api_view(['GET'])
def view_details_post(request, postId=None):
    try:
        if postId is not None:
            post = InternshipPost.objects.get(pk=postId)
            serializer = InternshipPostSerialzer(post)
            return Response(serializer.data)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)
    except InternshipPost.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND) 




@api_view(['POST'])
def add_post(request):
    post = InternshipPostSerialzer(data=request.data)

    if InternshipPost.objects.filter(**request.data).exists():
        raise serializers.ValidationError('This data already exits')
    if post.is_valid():
        post.save()
        return Response(post.data , status=status.HTTP_201_CREATED)
    else:
        return Response(status=status.HTTP_404_NOT_FOUND)


@api_view(['PUT'])
def update_post(request, postId):
    try:
        post = InternshipPost.objects.get(pk=postId)
    except InternshipPost.DoesNotExist:
        return Response({'error': 'Company not found'}, status=status.HTTP_404_NOT_FOUND)

    post_serializer = InternshipPostSerialzer(post, data=request.data)
    if post_serializer.is_valid():
        post_serializer.save()
        return Response(post_serializer.data)
    else:
        return Response(post_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['DELETE'])
def delete_post(request, postId):
    try:
        post = InternshipPost.objects.get(pk=postId)
    except InternshipPost.DoesNotExist:
        return Response({'error': 'Company not found'}, status=status.HTTP_404_NOT_FOUND)

    post.delete()
    return Response(status=status.HTTP_204_NO_CONTENT)

