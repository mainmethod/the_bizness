TheBizness::Application.routes.draw do
  
  root :to => "home#index"
    
  devise_for :users
  
  resources :users, :only => [:index, :show, :update]
  resources :posts, :only => [:create, :index]
  
  match "users/follow/:id" => "users#follow", :as => :follow_user
  match "users/unfollow/:id" => "users#unfollow", :as => :unfollow_user
  match "me" => "users#me", :as => :profile
  
end
