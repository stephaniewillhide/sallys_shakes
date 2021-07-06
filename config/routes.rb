Rails.application.routes.draw do
  root "shakes#index"

  get "/shakes", to: "shakes#index"
end
