Rails.application.routes.draw do
  resources :categories

  resources :joueurs

  get   'versus', to: 'versus#new', as: 'versus'
  post  'versus', to: 'versus#create'

  get 'classements', to: 'application#classements', as: 'classements'

  get 'a-propos', to: 'application#about', as: 'about'

  root to: 'application#accueil'
end
