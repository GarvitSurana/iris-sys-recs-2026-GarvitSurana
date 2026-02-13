# iris-sys-recs-2026
IRIS Systems Recruitment Task 2026

About
This repository contains my submission for the IRIS Systems Team recruitment task.
I am new to Docker and systems, and this project helped me learn how to deploy a Rails application using containers step by step.

What I Used
Ruby on Rails
Docker and Docker Compose
MySQL
Nginx
Prometheus and Grafana
GitHub Actions

What I Did
1. Dockerized the Rails App
Created a dockerfile for the rails application
Installed required dependencies inside the container
Ran the rails server inside Docker

2. Rails + MySQL with docker compose
Ran rails and MySQL in separate containers
Connected both using docker networking
Database port is not exposed
Used Docker volumes to keep database data safe
Ran migrations inside the container

3. Nginx reverse proxy
Added an Nginx container in front of rails
Exposed only Nginx on port 80
Rails app is not accessed directly

4. Load Balancing
Ran 3 Rails application containers
Configured Nginx to distribute traffic between them
All containers connect to the same database

5. Rate Limiting
Added basic request rate limiting in Nginx
This helps protect the application from too many requests

6. Monitoring
Set up Prometheus to collect metrics
Used Grafana to view system and container metrics
Imported a pre-built dashboard for monitoring

Bonus: GitHub Actions
Added a GitHub Actions workflow
Automatically builds the Docker image on every push to main
Pushes the image to Docker Hub using secrets

I added a simple shell script to back up the database and important project files.
The script uses mysqldump for database backup and stores all backups in the backups/ folder.
On windows, the script was tested using Git Bash.

Challenges i faced - 
1.Git merge conflicts while moving repositories – When shifting my work to the new IRIS repository(originally i did some work in github classroom repo), I faced merge conflicts. I carefully resolved conflicts in the Gemfile and README.md and completed the merge properly.
2.Dependency version conflicts (Rails & ActiveSupport) – The Docker build failed due to wrong gem versions. I searched up about it and i commented out the active support and activerecord version as removing those explicit versions allowed Bundler to resolve dependencies correctly.


How to Run
docker compose up --build --scale app=3


Access:
App: http://localhost
Prometheus: http://localhost:9090
Grafana: http://localhost:3001

Stop everything:
docker compose down

