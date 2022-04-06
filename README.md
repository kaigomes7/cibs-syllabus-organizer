# README
This README will document the necessary steps in order to get this application downloaded, run, and deployed.


## Introduction

CIBSSyllabusOrganizer is an online application that makes it easy for business students to upload their syllabi for classes they want to take abroad for approval. When a student uploads a syllabi with the corresponding information, an administrator will assign the request to a specific department for approval. The department reviewers will go through the syllabus and find the correct contact hours for the class and submit it to the administrator for approval. If the student is able to take the course abroad, then the administrator will be able to approve the request. Happy travels!

## External Deps

- Docker - Download latest version at https://www.docker.com/products/docker-desktop
- Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
- Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
- GitHub Desktop (Not needed, but HELPFUL) at https://desktop.github.com/

## Installation

Download this code repository by using git: `git clone https://github.com/kaigomes7/cibs-syllabus-organizer.git`

## Testing

You can run both the unit and integration tests by running `rspec .`

You can run 

## Execute Code Locally

First, navigate to the folder where you downladed the repository in Powershell if using Windows or the terminal if using a Mac. Once there, run the following command in order to get the docker app running:

`docker run --rm -it --volume "$(pwd):/csce431" -e DATABASE_USER=cibs_syllabus_organizer -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`

Next, navigate to the correct folder where your repository is located. Once there, run these following commands in order to get the app set up to run

`bundle install`
`rails db:create`
`rails db:migrate`
`rails db:seed`

Once all these commands are run, you can now run the app locally using: `rails server --binding:0.0.0.0`

The application can be seen using a browser and navigating to http://localhost:3000/