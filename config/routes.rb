Rails.application.routes.draw do


  root :to => "home#index"

  resources :programmers
  resources :clients
  resources :projects
  resources :schedules

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
