Rails.application.routes.draw do
  root "application#home"
  devise_for :users, controllers: {sessions: 'user/sessions',registrations: "user/registrations"}
  resources :searches, only: [:index, :create]
  resources :analytic_trends, only: [:index, :create]
end
