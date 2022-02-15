Rails.application.routes.draw do
  # devise_for :admins
  resources :foreign_courses_tamu_courses
  resources :reviewers
  resources :tamu_departments
  resources :universities
  resources :tamu_courses
  resources :students
  resources :foreign_courses
  resources :courses_students
  # root "pending_requests#index"
  get "pending_requests", to: "pending_requests#index"
  get "all_requests", to: "all_requests#index"
  get "approved_requests", to: "approved_requests#index"
  # root "reviewers#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'dashboards#show'
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end
end
