Rails.application.routes.draw do


  get 'static_page/about'

  get 'static_page/contact'

  devise_for :admins
resources :properties
  root 'static_page#home'
end
