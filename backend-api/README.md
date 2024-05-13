## Introduction

This is a simple pipeline example for a [Laravel]((https://laravel.com/docs)) application, showing just
how easy it is to get up and running with Laravel development using GitLab.

## What's contained in this project

This repository contains the basic folder structure of a Laravel application. 

The `.gitlab-ci.yml` contains the configuration needed for GitLab to build your code. Let's take a look, section by section.

Firstly, a docker image to test PHP applications with Gitlab CI (or any other CI platform!) was used to build our project. For more info on the docker image: [https://github.com/edbizarro/gitlab-ci-pipeline-php](https://github.com/edbizarro/gitlab-ci-pipeline-php)

```
image: edbizarro/gitlab-ci-pipeline-php:latest
```

We're defining two stages here: `test`, and `deploy`. As your project grows
in complexity you can add more of these. 

```
stages:
    - test
    - deploy
```

Also a `before_script` job is implemented to install the neccessary npm (for frontend assets) and php dependencies.

```
before_script:
    # Install Node dependencies.
    - npm install
    # install composer dependencies
    - composer install --prefer-dist --no-ansi --no-interaction --no-progress
    # Copy over example configuration.
    # Don't forget to set the database config in .env.example correctly
    - cp .env.example .env
    # Generate an application key. Re-cache.
    - php artisan key:generate
    - php artisan config:cache
    # Run database migrations.
    - php artisan migrate:refresh --seed
    # Run database seed
    - php artisan db:seed
```

Next, we test our application if there's any available tests in the `tests` directory.

```
test:
  script:
    # run laravel tests
    - php vendor/bin/phpunit --coverage-text --colors=never
```

Finally, we deploy our application. This section is not limited to the below code but can be configured based on your project requirements.  You can also deploy to cloud services like Amazon, Google Cloud, Heroku, etc.

```
deploy:
  stage: deploy
  script: echo "Define your deployment script!"
  environment: production
```

Your `.gitlab-ci.yml` configuration can be customized based on your preferences. To learn more, read the documentation [here](https://docs.gitlab.com/ee/ci/yaml/).
