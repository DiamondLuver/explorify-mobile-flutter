from django.db import models

class ToDo(models.Model):
  task = models.CharField(max_length=2048)
  completed = models.BooleanField(default=False)

  def __str__(self):
      return self.task