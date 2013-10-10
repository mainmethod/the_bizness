TheBizness::Application.routes.draw do
  
  root :to => "home#index"
    
  devise_for :users
  
  resources :users, :only => [:index, :show]
  
  match "users/follow/:id" => "users#follow", :as => :follow_user
  match "users/unfollow/:id" => "users#unfollow", :as => :unfollow_user
  
end
