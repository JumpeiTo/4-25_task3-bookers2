Rails.application.routes.draw do
  
   devise_for :users
   
  # ルートページ
  root to: "homes#top"
  
  resources :books, only: [:new, :index, :show, :create, :destroy]
  resources :users, only: [:show, :edit, :edit]
  get '/homes/about' => 'homes#about' , as: 'about'
  
end
