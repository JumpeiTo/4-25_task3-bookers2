Rails.application.routes.draw do
  
  devise_for :users
   
  # ルートページ
  root to: "homes#top"
  get '/home/about' => 'homes#about' , as: 'about'
  
  resources :books, only: [:new, :index, :show, :create, :destroy, :edit ,:update]
  resources :users, only: [:show, :edit, :update, :index]
  
end
