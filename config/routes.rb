Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
    devise_for :users, controllers: { sessions: "api/v1/sessions", registrations: "api/v1/registrations" }
    resources :pages
    resources :skills 
    resources :goals
    resources :train_dates
    resources :users
    end 
  end
end
