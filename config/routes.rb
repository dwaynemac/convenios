Convenios::Application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "/login", :to => "devise/cas_sessions#new"
    post '/logout', to: "devise/cas_sessions#destroy"
  end

  resources :businesses, only: [:update]
  resources :deals do
    collection do
      get :my_federation
    end
  end

  namespace :api do
    resources :deals, only: [:index, :show]
  end


  root to: 'deals#my_federation'
end
