# **Capstone_II**


**Description**

This project provides a full-stack solution with a Laravel backend API, a Flutter mobile frontend, and a React web frontend, enabling you to build robust and interactive applications.

**Getting Started**

1. **Prerequisites:**
   - Ensure you have Node.js (`node -v`) and npm (`npm -v`) installed on your system. You can download them from [https://nodejs.org/en](https://nodejs.org/en).
   - For Flutter development, follow the official installation guide: [https://docs.flutter.dev/](https://docs.flutter.dev/)
   - For Django development, can check out the documentation: [https://docs.djangoproject.com/en/5.0/](https://docs.djangoproject.com/en/5.0/)

2. **Clone the Repository:**

   ```bash
   git clone https://gitlab.com/DiamondLuver/Capstone_II.git
   ```

3. **Install Dependencies:**

  - **Backend (Django):**
     - Navigate to the backend directory: `cd backend-api`
     - Create a `.env` file for environment variables and specify your Django settings:
    
  There are two `env` in the project directory

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

  - 
    - Update the values in the `.env` file as needed.  
    - **Secret Key**: Django requires a secret key for cryptographic signing. You can generate a new secret key by running:
    ```bash
    docker exec -it web python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())'
    ```
-----------

*
     - Copy the generated key and set it as the value of `SECRET_KEY` in the `.env` file in the server folder.

     - **Database Configuration**: Update the database settings in the `.env` file to match your database configuration.
     - For any change and creation such as database and migrate, go to docker shell instead of the VS Code terminal 

- **Mobile Frontend (Flutter):**
     - Navigate to the mobile frontend directory: `cd frontend-mobile`
     - Install Flutter dependencies: `flutter pub get`

- **Web Frontend (React):**
     - Navigate to the web frontend directory: `cd frontend-web`
     - Install npm dependencies: `npm install`

4. **Start the Development Server:**

   - **Backend (Django):**
        - **In Local using virtual environment**
        (Optional) Create virtual environment using conda or python and activate it.
        Run the Django development server: `python manage.py runserver` (This will start the server on http://localhost:8000 by default)
        - **In Docker**
        Run and build the container: `docker-compose up --build`
   - **Mobile Frontend (Flutter):**
     - Follow the instructions in the Flutter documentation to run your app on a physical device or emulator: [https://docs.flutter.dev/](https://docs.flutter.dev/)

   - **Web Frontend (React):**
      + **In Command**
        - Start the React development server: `npm run dev` (This will usually start the server on http://localhost:8080 by default)
      + **In Docker**
       Running with Docker. If you prefer running the project using Docker, make sure you have Docker installed and follow these steps:

    Build the Docker image:

    ```bash
    docker build . -t frontend-web:v1.0
    ```

    Run the Docker container:

    ```bash
    docker run -d -p 8080:8080 frontend-web:v1.0
    ```
    
**Project Structure**

```
your-project-name/
├── backend-api/  # Django backend API
│   ├── server/   # Django project directory
│   │   ├── settings.py  # Django project settings
│   │   ├── urls.py  # Django URL configuration
│   │   └── ...  # Other Django files
│   │   ├── .env  # Environment variables for Django project
│   └── manage.py...  # Other Django files
│   ├── .env  # Environment variables for Docker setup
│   └── ...  # Other Docker-related files
├── frontend-mobile/  # Flutter mobile frontend
│   ├── lib/  # Flutter code
│   ├── pubspec.yaml  # Flutter project configuration
│   └── ...  # Other Flutter files
└── frontend-web/  # React web frontend
    ├── public/  # Publicly accessible files (build output)
    ├── src/  # React source code
    ├── package.json  # Project dependencies
    └── ...  # Other React files

```


**Deployment**

Deployment instructions will vary depending on your chosen hosting provider. Here are some general guidelines:

- **Backend (Django):**
  - Configure your web server (e.g., Apache, Nginx) to serve the Django application from the `wsigx` directory.
 
- **Mobile Frontend (Flutter):**
  - Follow the platform-specific deployment instructions provided by Flutter: [https://docs.flutter.dev/](https://docs.flutter.dev/)
- **Web Frontend (React):**
  - Build the React application for production: `npm run build`
  - Deploy the built files (usually in the `web/public` directory) to your web server.



**License**