AngularRailsDemo::Application.routes.draw do
  namespace :api do
    resources :tasks
  end

  match '/' => 'home#index'
  match '/tasks' => 'home#index'
  match '/tasks/*page' => 'home#index'
end
