AngularRailsDemo::Application.routes.draw do
  namespace :api do
    resources :tasks
  end

  get '/' => 'home#template'
  get '/tasks' => 'home#template'
  get '/tasks/new' => 'home#template'
  get '/tasks/:id/edit' => 'home#template'
  get '/tasks_assets/menu' => 'home#menu'
  get '/tasks_assets/index' => 'home#index'
  get '/tasks_assets/new' => 'home#new'
  get '/tasks_assets/edit' => 'home#edit'
  get '/tasks_assets/_form' => 'home#form'
  get '/tasks_assets/layout' => 'home#layout'
end
