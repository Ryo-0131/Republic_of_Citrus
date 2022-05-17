Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users do
    member do
      get :likes
    end
  end
  resources :items do
   resources :reviews
  end
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end