Rails.application.routes.draw do
  root 'top#form'

  get '/err', to: 'err#err'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # devise_for :users
  devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: "users/registrations",
}
  # ユーザープロフィール画面は独自に作成する
  resources :users, only: [:show,:edit,:update] do
    member do
      get :parking_info
      get :parking_info_qr
    end
  end

  resources :parkings

  resources :tests

end
