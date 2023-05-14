Rails.application.routes.draw do
  
  devise_for :users
   
  # ルートページ
  root to: "homes#top"
  
  resources :books, only: [:new, :index, :show, :create, :destroy, :edit ,:update]
  resources :users, only: [:show, :edit, :update, :index]
  get '/homes/about' => 'homes#about' , as: 'about'
  
end
