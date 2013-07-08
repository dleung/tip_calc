AngularRailsDemo::Application.routes.draw do
  namespace :api do
    resources :tasks
  end

  scope 'tasks' do
    get ''         => 'tasks#template'
    get 'new'      => 'tasks#template'
    get ':id/edit' => 'tasks#template'
  end

  scope '/tasks_assets' do
    get 'menu'   => 'tasks#menu'
    get 'index'  => 'tasks#index'
    get 'new'    => 'tasks#new'
    get 'edit'   => 'tasks#edit'
    get '_form'  => 'tasks#form'
    get 'layout' => 'tasks#layout'
  end

  root to: 'home#index'
end
