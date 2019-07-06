Rails.application.routes.draw do
  get "link_pages", to: "link_pages#index"
  get "link_pages/:id", to: "link_pages#get"
  post "link_pages", to: "link_pages#create"
  put "link_pages/:id", to: "link_pages#update"
  delete "link_pages/:id", to: "link_pages#destroy"

  get "users", to: "users#index"
  get "users/:id", to: "users#get"
  post "users", to: "users#create"
end
