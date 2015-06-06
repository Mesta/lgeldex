Rails.application.routes.draw do
  get 'a-propos', to: 'application#about', as: 'about'
  root to: 'application#accueil'
end
