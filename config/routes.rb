Convenios::Application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "/login", :to => "devise/cas_sessions#new"
    post '/logout', to: "devise/cas_sessions#destroy"
  end

  resources :deals do
    member do
      get :cancel
    end
  end

  root to: 'deals#index'
end
