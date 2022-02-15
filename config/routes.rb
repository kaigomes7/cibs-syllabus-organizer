# frozen_string_literal: true

Rails.application.routes.draw do
  resources :foreign_courses_tamu_courses
  resources :reviewers
  resources :tamu_departments
  resources :universities
  resources :tamu_courses
  resources :students
  resources :foreign_courses
  resources :courses_students
<<<<<<< Updated upstream
  root "reviewers#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
=======
  root 'pending_requests#index'
  get 'pending_requests', to: 'pending_requests#index'
  get 'all_requests', to: 'all_requests#index'
  get 'approved_requests', to: 'approved_requests#index'
>>>>>>> Stashed changes
end
