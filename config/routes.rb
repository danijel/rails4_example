Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users do
    post 'upload_avatar', :on => :member
  end
end
