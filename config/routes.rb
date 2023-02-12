Rails.application.routes.draw do
  resources :train_dates
  resources :goals

  namespace :api do
    namespace :v1 do
    devise_for :users, controllers: { sessions: "api/v1/sessions", registrations: "api/v1/registrations" }
  resources :pages
  resources :skills
    end 
  end
end
