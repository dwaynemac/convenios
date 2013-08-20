Convenios::Application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "/login", :to => "devise/cas_sessions#new"
    post '/logout', to: "devise/cas_sessions#destroy"
  end

  resources :deals

  root to: 'deals#index'
end
