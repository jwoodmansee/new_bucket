Rails.application.routes.draw do
 root 'home#show'
 resources :buckets do
  resources :lists
end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
