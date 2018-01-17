Rails.application.routes.draw do
  resources :list_tags
  resources :tags
  resources :list_items
  resources :lists
  root to: "lists#index"
  resources :trashes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
