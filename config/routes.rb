AngularRailsDemo::Application.routes.draw do
  namespace :api do
    resources :tasks
  end

  match '/' => 'home#template'
  match '/tasks' => 'home#template'
  match '/tasks/new' => 'home#template'
  match '/tasks/:id/edit' => 'home#template'
  match '/tasks_assets/menu' => 'home#menu'
  match '/tasks_assets/index' => 'home#index'
  match '/tasks_assets/new' => 'home#new'
  match '/tasks_assets/edit' => 'home#edit'
  match '/tasks_assets/_form' => 'home#form'
  match '/tasks_assets/layout' => 'home#layout'
end
