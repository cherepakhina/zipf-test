Rails.application.routes.draw do
  resources :distribution_data_carmillas
  resources :distribution_data_lovecrs
  resources :texts_for_zipfs
  resources :texts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'about', to: 'pages#about'
  get 'help', to: 'pages#help'
  get 'distributionCarmilla', to: 'pages#distribution_carmilla'

  root 'pages#home'
end