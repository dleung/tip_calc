AngularRailsDemo::Application.routes.draw do
  scope 'checks' do
    get ''         => 'checks#template'
    get 'new'      => 'checks#template'
    get ':id/edit' => 'checks#template'
  end

  scope '/checks_assets' do
    get 'layout'   => 'checks#layout'
    get 'index'    => 'checks#index'
    get 'menu'     => 'checks#menu'
  end

  root to: 'home#index'
end
