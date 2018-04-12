Rails.application.routes.draw do
  devise_for :users
  root                'static_page#home'

  get 'about'    =>   'static_page#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end