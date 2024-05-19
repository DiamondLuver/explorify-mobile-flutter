# Django RESTful API Demo

```markdown
# Django Dockerized Project

This is a Dockerized Django project for [brief description].

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

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
    
    There are two env in the project directory

   ```bash
   cp .env.example .env
   ```
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
   docker-compose up --build
   ```

2. Access the Django application at `http://localhost:8989/`.

### Configuration

- **Secret Key**: Django requires a secret key for cryptographic signing. You can generate a new secret key by running:

  ```bash
  docker-compose run web python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())'
  ```

  Copy the generated key and set it as the value of `SECRET_KEY` in the `.env` file.

- **Database Configuration**: Update the database settings in the `.env` file to match your database configuration.

### Custom Commands

- **Create Superuser**: To create a superuser, run:

  ```bash
  docker-compose run web python manage.py createsuperuser
  ```

### License

This project is licensed under the [MIT License].
