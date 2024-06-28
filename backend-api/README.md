# Django RESTful API Demo

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

The toturial of Set up the docker here:
`https://youtu.be/_Wkge1cUoYA?si=VjxsmQ5uVoqXBEpo`
### Prerequisites

- Docker
- Docker Compose

### Installation

1. Clone the repository:

   ```bash
   git clone https://gitlab.com/DiamondLuver/Capstone_II.git
   ```

2. Navigate into the project directory:

   ```bash
   cd backend-api
   ```

3. Create a `.env` file for environment variables and specify your Django settings:

   Update the values in the `.env` file as needed.

   ```bash
   cd server
   ```

   ```bash
   cp .env.example .env
   ```

   Update the values in the `.env` file as needed.

### Usage

1. Start the Docker containers:

   ```bash
   <!-- Build Image -->
   docker compose -f "build-process/backend-project/docker-compose-django-backend.yml" build
   <!-- Create container to run image with log show in terminal -->
   docker compose -f "build-process/backend-project/docker-compose-django-backend.yml" up
   <!-- Create container to run image without log show in terminal -->
   docker compose -f "build-process/backend-project/docker-compose-django-backend.yml" up -d
   <!-- Remove containers -->
   docker compose -f "build-process/backend-project/docker-compose-django-backend.yml" down
   ```

2. Access the Django application at `http://localhost:8989/`.

### Configuration
   The configuration are set already in the .env.example file, so you can skip this part
- **Secret Key**: Django requires a secret key for cryptographic signing. You can generate a new secret key by running:

- **Database Configuration**: Update the database settings in the `.env` file to match your database configuration.

### License

This project is licensed under the [MIT License].


# About Polymorphism in Django Models
Yes, the use of `GenericForeignKey` in Django can be considered a form of polymorphic relationship. In object-oriented programming, polymorphism allows objects of different classes to be treated as objects of a common superclass. In the context of databases and ORM (Object-Relational Mapping), polymorphic relationships allow a model to be associated with multiple other models.

In Django, `GenericForeignKey` is a way to implement polymorphic relationships by allowing a single model (like `Comment`, `Favorite`, or `Reply`) to refer to instances of different models (like `Article`, `Post`, or `InternshipPost`). This is achieved by storing the content type and object ID, which together uniquely identify any model instance in the database.

### Summary of Polymorphic Relationship with `GenericForeignKey`:

- **Polymorphic Relationships**: They enable a model to be associated with instances of multiple models.
- **GenericForeignKey**: This Django feature allows creating such relationships by storing references to any model instance dynamically.

### Example Implementation Recap

Here is a recap of the polymorphic relationship using `GenericForeignKey` for comments, favorites, and replies across different models:

1. **Models with Polymorphic Relationships**:
   
   ```python
   from django.db import models
   from django.contrib.contenttypes.fields import GenericForeignKey
   from django.contrib.contenttypes.models import ContentType
   from account.models import User

   class Comment(models.Model):
       user = models.ForeignKey(User, on_delete=models.CASCADE)
       content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)
       object_id = models.PositiveIntegerField()
       content_object = GenericForeignKey('content_type', 'object_id')
       content = models.TextField()
       created_on = models.DateTimeField(auto_now_add=True)
       active = models.BooleanField(default=True)

       class Meta:
           ordering = ['created_on']

       def __str__(self):
           return f'Comment {self.content} by {self.user}'

   class Reply(models.Model):
       user = models.ForeignKey(User, on_delete=models.CASCADE)
       comment = models.ForeignKey(Comment, on_delete=models.CASCADE, related_name='replies')
       content = models.TextField()
       created_on = models.DateTimeField(auto_now_add=True)
       active = models.BooleanField(default=True)

       def __str__(self):
           return f'Reply {self.content} by {self.user}'

   class Favorite(models.Model):
       user = models.ForeignKey(User, on_delete=models.CASCADE)
       content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)
       object_id = models.PositiveIntegerField()
       content_object = GenericForeignKey('content_type', 'object_id')
       created_on = models.DateTimeField(auto_now_add=True)

       def __str__(self):
           return f'Favorite {self.content_object} by {self.user}'
   ```

2. **Example Content Models**:

   ```python
   from django.db import models

   class Article(models.Model):
       title = models.CharField(max_length=255)
       content = models.TextField()
       created_on = models.DateTimeField(auto_now_add=True)
       updated_on = models.DateTimeField(auto_now=True)

       def __str__(self):
           return self.title

   class Post(models.Model):
       title = models.CharField(max_length=255)
       content = models.TextField()
       created_on = models.DateTimeField(auto_now_add=True)
       updated_on = models.DateTimeField(auto_now=True)

       def __str__(self):
           return self.title

   class InternshipPost(models.Model):
       title = models.CharField(max_length=255)
       content = models.TextField()
       created_on = models.DateTimeField(auto_now_add=True)
       updated_on = models.DateTimeField(auto_now=True)

       def __str__(self):
           return self.title
   ```

3. **Creating Instances of Polymorphic Relationships**:

   ```python
   from django.contrib.contenttypes.models import ContentType

   user = User.objects.get(id=1)
   article = Article.objects.get(id=1)
   post = Post.objects.get(id=1)
   comment = Comment.objects.get(id=1)

   article_content_type = ContentType.objects.get_for_model(Article)
   post_content_type = ContentType.objects.get_for_model(Post)

   # Creating a comment for an article
   comment = Comment.objects.create(
       user=user,
       content_type=article_content_type,
       object_id=article.id,
       content="This is a comment on the article."
   )

   # Creating a favorite for a post
   favorite = Favorite.objects.create(
       user=user,
       content_type=post_content_type,
       object_id=post.id
   )

   # Creating a reply to a comment
   reply = Reply.objects.create(
       user=user,
       comment=comment,
       content="This is a reply to the comment."
   )
   ```

4. **Querying Polymorphic Relationships**:

   ```python
   # Get all comments for an article
   article_comments = Comment.objects.filter(content_type=article_content_type, object_id=article.id)

   # Get all favorites for a post
   post_favorites = Favorite.objects.filter(content_type=post_content_type, object_id=post.id)

   # Get all replies for a comment
   comment_replies = Reply.objects.filter(comment=comment)
   ```

By following this approach, you can effectively implement polymorphic relationships in Django, allowing your `Comment`, `Favorite`, and `Reply` models to interact with multiple other models seamlessly.