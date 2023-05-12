Rails.application.routes.draw do
  
  # ルートページ
  root to: "homes#top"
  
  devise_for :users
  
  resources :books, only: [:new, :index, :show, :create]
  get '/homes/about' => 'homes#about' , as: 'about'
  
end
