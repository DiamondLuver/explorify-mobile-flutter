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


