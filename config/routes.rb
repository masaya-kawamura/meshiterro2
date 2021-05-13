Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users

  #画像投稿に紐つけて、コメントをネストする
  resources :post_images, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]

end
