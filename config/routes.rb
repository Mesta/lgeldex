Rails.application.routes.draw do
  resources :categories

  resources :joueurs

  get 'a-propos', to: 'application#about', as: 'about'
  root to: 'application#accueil'
end
