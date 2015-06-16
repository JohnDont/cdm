Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :omniauth_callbacks => "omniauth_callbacks"
  }
  root 'welcome#index'

  scope :upload, controller: :uploads, as: :upload do
    get :new
    post :create
    get 'share/:id', action: :share, as: :share
  end

  resources :songs, only: [:new, :create] do
    member do
      get :share
      post :vote
      post :play
      get :play
    end
  end

  resources :users, only: [:show]
end
