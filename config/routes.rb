Rails.application.routes.draw do
  resources :products
  resources :orders
  resources :clients
  devise_for :users
  devise_scope :user  do
    get   "/users",               to: "users#index",      as: "users"
    post  "/create-users",        to: "users#create",     as: "create_users"
    get   "/users/new",           to: "users#new",        as: "new_user"
    get   "users/:id/edit",       to: "users#edit",       as: "edit_user"
    get   "users/:id",            to: "users#show",       as: "user"
    patch "users/:id",             to: "users#update"
    put   "users/:id",            to: "users#update"
    delete "users/:id",           to: "users#destroy"
  end

  # Custom routes
  get   "/admin",               to: "admin#index"
  get   "/reports",             to: "admin#reports"
  get   "/resource_datatable",  to: "admin#resource_datatable"
  get   "/get_product_price",   to: "products#get_product_price"

  # root
  root "home#index"

end
