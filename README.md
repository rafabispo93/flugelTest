# flugelTest

# Objectives:
    - Hello World python application in python
    - Run the application using Docker and Docker-Compose

# Commands to Run application locally
    - First you have to make sure that you have docker and docker-compose installed. See orientations at https://docs.docker.com/compose/install/.
    - Open the repository flugelTest
    - Run the command "docker-compose build"
    - Run the command "docker-compose up"
    - The server will be available at http://0.0.0.0:5000/

# Commands to deploy application go GKE

    - First you have to install Terraform, see instructions at https://learn.hashicorp.com/terraform/getting-started/install.html

    - After the step above you will have to unzip the zip file credential with the password provided by the admin of this repository.
    
    - Inside the root folder flugelTest is necessary to run the following commands:
        1. terraform init
        2. terraform plan
        3. terradorm apply
