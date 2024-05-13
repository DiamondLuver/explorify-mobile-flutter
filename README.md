# **Capstone_II**


**Description**

This project provides a full-stack solution with a Laravel backend API, a Flutter mobile frontend, and a React web frontend, enabling you to build robust and interactive applications.

**Getting Started**

1. **Prerequisites:**
   - Ensure you have Node.js (`node -v`) and npm (`npm -v`) installed on your system. You can download them from [https://nodejs.org/en](https://nodejs.org/en).
   - For Flutter development, follow the official installation guide: [https://docs.flutter.dev/](https://docs.flutter.dev/)
   - For Laravel development, make sure you have Composer installed: [https://getcomposer.org/doc/articles/troubleshooting.md](https://getcomposer.org/doc/articles/troubleshooting.md)

2. **Clone the Repository:**

   ```bash
   git clone https://gitlab.com/DiamondLuver/Capstone_II.git
   ```

3. **Install Dependencies:**

   - **Backend (Laravel):**
     - Navigate to the backend directory: `cd backend-api`
     - Install Composer dependencies: `composer install`
     - Generate an application key: `php artisan key:generate`
     - Create a `.env` file and configure your database and other environment variables according to Laravel's documentation: [https://laravel.com/docs/11.x/installation](https://laravel.com/docs/11.x/installation)
     - Run database migrations: `php artisan migrate` (if applicable)

   - **Mobile Frontend (Flutter):**
     - Navigate to the mobile frontend directory: `cd frontend-mobile`
     - Install Flutter dependencies: `flutter pub get`

   - **Web Frontend (React):**
     - Navigate to the web frontend directory: `cd frontend-web`
     - Install npm dependencies: `npm install`

4. **Start the Development Server:**

   - **Backend (Laravel):**
        - **In XAMPP or MAMP**
        (Optional) Set up a local development server using a tool like XAMPP or MAMP.
         Run the Laravel development server: `php artisan serve` (This will start the server on http://localhost:8000 by default)
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
├── backend-api/  # Laravel backend API
│   ├── app/   # Laravel application code
│   ├── config/  # Laravel configuration files
│   ├── database/  # Database files (migrations, seeds, etc.)
│   ├── public/  # Publicly accessible files
│   ├── resources/  # Laravel resources (views, routes, etc.)
│   ├── routes/  # API routes
│   ├── .env  # Environment variables
│   └── ...  # Other Laravel files
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

**API Documentation**

API documentation will be added soon. In the meantime, you can explore the API routes defined in the `backend/routes` directory or use tools like Laravel Dingo API to generate documentation automatically: [https://github.com/dingo/api](https://github.com/dingo/api)

**Deployment**

Deployment instructions will vary depending on your chosen hosting provider. Here are some general guidelines:

- **Backend (Laravel):**
  - Configure your web server (e.g., Apache, Nginx) to serve the Laravel application from the `public` directory.
  - Consider using a deployment tool like Laravel Forge or Envoyer for streamlined deployments.
- **Mobile Frontend (Flutter):**
  - Follow the platform-specific deployment instructions provided by Flutter: [https://docs.flutter.dev/](https://docs.flutter.dev/)
- **Web Frontend (React):**
  - Build the React application for production: `npm run build`
  - Deploy the built files (usually in the `web/public` directory) to your web server.



**License**