Rails.application.routes.draw do
  resources :admins
  resources :tamu_departments
  resources :universities
  resources :foreign_courses_tamu_courses
  resources :reviewers
  resources :tamu_departments
  resources :universities
  resources :tamu_courses
  resources :students
  resources :foreign_courses
  resources :foreign_courses_students
  root to: 'dashboards#show'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'users/sign_in', to: 'users/sessions#new', as: :new_user_session
    get 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end
  # admin views
  get 'assign_reviewer', to: 'assign_reviewer#index'
  get 'pending_reviewer_approved', to: 'pending_reviewer_approved#index'
  get 'all_course_requests', to: 'all_course_requests#index'
  # studnet views
  get 'my_requests', to: 'my_requests#index'
  get 'all_requests', to: 'all_requests#index'
  get 'approved_requests_students', to: 'approved_requests_students#index'
  get 'new_request', to: 'foreign_courses#new'
  # reviwer views
  get 'pending_requests', to: 'pending_requests#index'
  get 'approved_requests_reviewers', to: 'approved_requests_reviewers#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
