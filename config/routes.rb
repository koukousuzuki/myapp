Rails.application.routes.draw do
  devise_for :users
  resources :posts , :only => [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :welcome, :only => [:index]
  root "welcome#index"
  
end
