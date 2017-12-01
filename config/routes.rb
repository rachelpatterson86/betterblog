Rails.application.routes.draw do
  resources :users, :only => [:index] do
    resources :posts do
      resources :comments, only: [:create, :delete]
    end
  end
end
