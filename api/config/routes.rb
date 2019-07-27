Rails.application.routes.draw do
  resources :links
  resources :link_pages do
    resources :links
  end

  get "users", to: "users#index"
  get "users/:id", to: "users#get"
  post "users", to: "users#create"

  post "tokens", to: "tokens#create"
  delete "tokens", to: "tokens#destroy"

  get "me", to: "auth#me"
end
