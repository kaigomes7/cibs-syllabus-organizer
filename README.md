# README
This README will document the necessary steps in order to get this application downloaded, run, and deployed.


## Introduction

CIBSSyllabusOrganizer is an online application that makes it easy for business students to upload their syllabi for classes they want to take abroad for approval. When a student uploads a syllabi with the corresponding information, an administrator will assign the request to a specific department for approval. The department reviewers will go through the syllabus and find the correct contact hours for the class and submit it to the administrator for approval. If the student is able to take the course abroad, then the administrator will be able to approve the request. Happy travels!

## Requirements

Here is a list of the gems used for the application. This can also be viewed in  `Gemfile`:

- Ruby 3.0.2
- Rails - 6.1.4.1
- PostgreSQL - 1.1
- Puma 5.0
- SCSS - 6
- Webpacker - 5.0
- turbolinks - 5
- jbuilder - 2.7
- Bootstrap - latest version
- activestorage-validator - latest version
- bootsnap - 1.4
- rexml - latest version
- byebug - latest version
- rspec-rails - latest version
- web-console - 4.1.0
- rack-mini-profiler - 2.0
- listen - 3.3
- spring - latest version
- brakeman - latest version
- capybara - 3.26
- selenium-webdriver - latest version
- webdrivers - latest version
- simplecov - latest version (not required)
- rubocop - latest version (not required)
- httparty - latest version
- nokogiri - latest version
- thread - latest version
- tzinfo-data - latest version
- devise - latest version
- devise-token_authenticatable - latest version
- warden - latest version
- omniauth - latest version
- omniauth-google-oauth2 - latest version
- omniauth-rails_csrf_protection - 1.0
- Docker (Latest Container) 

All of these dependencies are installed when running `bundle install`

## External Deps

- Docker - Download latest version at https://www.docker.com/products/docker-desktop
- Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
- Git - Download latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
- GitHub Desktop (Not needed, but HELPFUL) at https://desktop.github.com/

## Installation

Download this code repository by using git: `git clone https://github.com/kaigomes7/cibs-syllabus-organizer.git`

## Testing

You can test both the unit and integration tests by running `rspec .`

You can test both the code coverage by running `rspec .`

You can test the security coverage by running `brakeman`

You can test the code style by running `rubocop`

## Execute Code Locally

First, navigate to the folder where you downladed the repository in Powershell if using Windows or the terminal if using a Mac. Once there, run the following command in order to get the docker app running:

`docker run --rm -it --volume "$(pwd):/csce431" -e DATABASE_USER=cibs_syllabus_organizer -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`

Next, navigate to the correct folder where your repository is located. Once there, run these following commands in order to get the app set up to run

- `bundle install`
- `rails db:create`
- `rails db:migrate`
- `rails db:seed`

Once all these commands are run, you can now run the app locally using: `rails server --binding:0.0.0.0`

The application can be seen using a browser and navigating to http://localhost:3000/