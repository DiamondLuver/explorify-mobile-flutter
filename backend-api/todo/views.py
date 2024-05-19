from django.http.response import JsonResponse
from rest_framework import status
from rest_framework.exceptions import NotFound
from rest_framework.parsers import JSONParser
from rest_framework.decorators import api_view

from todo.serializers import ToDoSerializer
from todo.models import ToDo

@api_view(['GET', 'POST', 'DELETE'])
def todos(request):
  # get all todos
  if request.method == 'GET':
    todos = ToDo.objects.all()
    serializer = ToDoSerializer(todos, many=True)
    return JsonResponse(serializer.data, safe=False)

  # create todo
  elif request.method == 'POST':
    request_data = JSONParser().parse(request)
    serializer = ToDoSerializer(data=request_data)
    if serializer.is_valid():
      serializer.save()
      return JsonResponse(serializer.data, status=status.HTTP_201_CREATED)
    return JsonResponse(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

  # purge all completed todos
  elif request.method == 'DELETE':
    completedToDos = ToDo.objects.filter(completed=True)
    if completedToDos.count() > 0:
      completedToDos.delete()
    return JsonResponse({}, status=status.HTTP_204_NO_CONTENT)


@api_view(['PATCH', 'DELETE'])
def todo(request, pk):
  try:
    todo = ToDo.objects.get(pk=pk)
  except ToDo.DoesNotExist:
    raise NotFound()

  # mark todo as completed
  if request.method == 'PATCH':
    serializer = ToDoSerializer(todo, {'completed': True}, partial=True)
    if serializer.is_valid():
      serializer.save()
      return JsonResponse({}, status=status.HTTP_204_NO_CONTENT)
    return JsonResponse(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

  # delete todo
  elif request.method == 'DELETE':
    todo.delete()
    return JsonResponse({}, status=status.HTTP_204_NO_CONTENT)
