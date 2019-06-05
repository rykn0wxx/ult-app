Rails.application.routes.draw do
  post 'user_token' => 'user_token#create', :as => 'user_token'
  resources :users, :defaults => { :format => 'json' }, :constraints => { :id => /.*/ }
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :boards
      # resources :lists
      # resources :cards
    end
  end
  root :to => 'home#index'
end
