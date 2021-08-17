Rails.application.routes.draw do
  devise_for :users
  root to: "dashboard#index"

  # get "/shakes", to: "shakes#index"
  # get "/shakes/:id", to: "shakes#show"

  resources :shakes, except: [:show]
  resources :ingredients, except: [:show]

end
