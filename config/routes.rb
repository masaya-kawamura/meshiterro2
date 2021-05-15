Rails.application.routes.draw do
  root to: 'post_images#index'
  devise_for :users

  #画像投稿に紐つけて、コメントをネストする
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]

end
