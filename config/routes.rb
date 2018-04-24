Rails.application.routes.draw do
  devise_for :users
  resources :users,   only: [:edit, :index, :show, :destroy]
  resources :books
  resources :autors,   only: [:new, :create]
  resources :comments, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  root                'static_page#home'

  get 'about'    =>   'static_page#about'

  get 'set_admin' => 'users#set_destroy_admin'
  get 'add_book'  => 'users#add_book'
  get 'moder_comment' => 'users#all_comment_moderation'
  get 'moderation'  => 'users#moderation'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
