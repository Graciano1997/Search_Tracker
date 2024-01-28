Rails.application.routes.draw do
  root "application#home"

  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations'
  }

  resources :searches, only: [:index]
  resources :analytic_trends, only: [:index, :create]
  get "/analytictrends", to: "analytic_trends#trends", default: {format: :json}
end
