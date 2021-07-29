Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :dogs
  resources :users

  get 'dogs/like/:id' => 'dogs#like'
  #get ':dogs/:like/:id'
  #get dogs#like
end
