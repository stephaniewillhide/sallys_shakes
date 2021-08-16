Rails.application.routes.draw do
  root to: "dashboard#index"

  # get "/shakes", to: "shakes#index"
  # get "/shakes/:id", to: "shakes#show"

  resources :shakes, except: [:show]
  resources :ingredients, except: [:show]

end
