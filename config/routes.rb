Tagport::Application.routes.draw do

  get "/users/sign_in" => redirect('/home/come_aboard')
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  get "home/index"
  get "home/contact"
  get "home/come_aboard"
  root :to => 'home#index'

  resources :searches

end
