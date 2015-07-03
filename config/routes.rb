Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :omniauth_callbacks => "omniauth_callbacks"
  }
  root 'welcome#index'

  get 'explore' => 'welcome#explore', as: :explore
  get 'explore/:category' => 'welcome#explore', as: :explore_category
  get 'challenge' => 'welcome#challenge'
  get 'about' => 'welcome#about'

  scope :upload, controller: :uploads, as: :upload do
    get :new
    post :create
    get 'share/:id', action: :share, as: :share
  end

  resources :songs, only: [:new, :create, :show] do
    member do
      get :share
      post :vote
      get :play
    end
  end

  resources :users, only: [:show]
end
