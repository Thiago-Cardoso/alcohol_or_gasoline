Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  post 'challenge', to: 'home#challenge'
end
