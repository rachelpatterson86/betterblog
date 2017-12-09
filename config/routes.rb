Rails.application.routes.draw do
  root to: 'users#index'
  resources :users, :except => [:edit, :update, :destroy] do
    resources :posts do
      resources :comments, only: [:create, :delete]
    end
  end
end
