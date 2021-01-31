Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :users, only: [:show, :index]
  resources :reports, only: [:create, :destroy, :show]
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  get 'users/:id/following' => 'relationships#following', as: 'following'
  get 'users/:id/follower' => 'relationships#follower', as: 'follower'

end
