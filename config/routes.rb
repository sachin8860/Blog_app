Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :blogs
  get 'blogs/categories/:category_id', to: 'blogs#show_category', as: :show_blogs_category
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'home#index'
  get 'home/about'
  get 'home/contact'
end


