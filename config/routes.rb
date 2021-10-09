Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :show]
  # :edit :update :destroy 機能毎に記入(,を忘れずに)
  # resources :items 7つのアクション全て実装できたらここを解除して4行目を削除する
end