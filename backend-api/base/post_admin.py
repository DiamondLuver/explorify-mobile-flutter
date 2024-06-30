from django.contrib import admin
from post.models import *

admin.site.register(Post)
admin.site.register(Comment)
admin.site.register(Reply)
admin.site.register(Favorite)
