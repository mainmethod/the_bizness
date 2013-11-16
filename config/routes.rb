TheBizness::Application.routes.draw do
  
  root :to => "posts#index"
    
  devise_for :users
  
  resources :jobs, :only => [:create, :new, :edit, :update]
  resources :locations, :only => [:show]
  resources :users, :only => [:index, :show, :update]
  resources :posts, :only => [:create, :index] do
    resources :comments, :only => [:create, :new]
  end
  
  post "home/search" => "home#search", :as => :search_path
  
  get "nearby/" => "locations#nearby", :as => :nearby
  get "nearby/:proximity" => "locations#nearby", :as => :nearby_proximity
  match "users/follow/:id" => "users#follow", :as => :follow_user
  match "users/unfollow/:id" => "users#unfollow", :as => :unfollow_user
  match "me" => "users#me", :as => :profile
  
end
