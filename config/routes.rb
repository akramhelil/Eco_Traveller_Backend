Rails.application.routes.draw do
  resources :posts
  resources :travellers
  resources :trips
  resources :comments

  post "/login", to: "auth#login"
  get "/auto_login", to: "auth#auto_login"
end
