Rails.application.routes.draw do

  get '/err', to: 'err#err'
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # devise_for :users
  devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: "users/registrations",
}
  # ユーザープロフィール画面は独自に作成する
  resources :users, only: [:show,:edit,:update]

  resources :parkings

  resources :tests

end
