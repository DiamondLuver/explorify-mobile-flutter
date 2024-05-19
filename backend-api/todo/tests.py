from rest_framework.test import APITestCase
from rest_framework.utils import json

from todo.models import ToDo

class ToDoCreateTestCase(APITestCase):
  api_path = '/api/v1/todo/'
  request_payload = {
    "task": "Run a test"
  }

  def create_todo(self):
    response = self.client.post(self.api_path, self.request_payload, format='json')
    response_payload = json.loads(response.content)
    status_code = response.status_code
    return status_code, response_payload

  def test_create_todo(self):
    initial_todo_count = ToDo.objects.count()
    status_code, response_payload = self.create_todo()

    # request succeeds
    self.assertEqual(status_code, 201)
    
    # record was created
    self.assertEqual(
      ToDo.objects.count(),
      initial_todo_count + 1,
    )

    # task was not changed
    for attr, expected_value in self.request_payload.items():
      self.assertEqual(response_payload[attr], expected_value)

    # id exists in response payload
    self.assertGreater(response_payload['id'], 0)
    
  def test_delete_one_todo(self):
    initial_todo_count = ToDo.objects.count()

    # create a todo to delete
    _, response_payload = self.create_todo()

    response = self.client.delete(
      self.api_path + str(response_payload['id']) + '/'
    )
    
    # request succeeds
    self.assertEqual(response.status_code, 204)

    # record was deleted
    self.assertEqual(ToDo.objects.count(), max(initial_todo_count - 1, 0))

  def test_patch_todo(self):
    # fails if record does not exist
    response = self.client.patch(self.api_path + '0' + '/')
    self.assertEqual(response.status_code, 404)

    # create a todo to update
    _, response_payload = self.create_todo()
    id = response_payload['id']

    response = self.client.patch(self.api_path + str(id) + '/')

    # request succeeds
    self.assertEqual(response.status_code, 204)

    # todo was marked as completed
    todo = ToDo.objects.get(pk=id)
    self.assertTrue(todo.completed)

  def test_delete_completed(self):
    # create a list of 5 todos and mark last 3 as completed
    ids = []
    i = 0
    while i < 5:
      _, response_payload = self.create_todo()
      id = response_payload['id']
      ids.append(id)
      if i > 1:
        self.client.patch(self.api_path + str(id) + '/')
      i += 1

    self.assertEqual(ToDo.objects.all().count(), 5)

    response = self.client.delete(self.api_path)

    # request succeeds
    self.assertEqual(response.status_code, 204)

    # exactly three todos were deleted
    self.assertEqual(ToDo.objects.all().count(), 2)

  def test_get(self):
    # create a list of 3 todos
    todos_count = 3
    i = 0
    while i < todos_count:
      self.create_todo()
      i += 1

    response = self.client.get(self.api_path)
    response_payload = json.loads(response.content)

    # request succeeds
    self.assertEqual(response.status_code, 200)

    # exactly three todos were returned
    self.assertEqual(len(response_payload), todos_count)
    