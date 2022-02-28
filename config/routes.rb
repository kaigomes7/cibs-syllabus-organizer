Rails.application.routes.draw do
  resources :admins
  resources :foreign_courses_tamu_courses
  resources :reviewers
  resources :tamu_departments
  resources :universities
  resources :tamu_courses
  resources :students
  resources :foreign_courses
  resources :courses_students
  root "reviewers#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
