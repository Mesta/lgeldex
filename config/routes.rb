# -*- encoding : utf-8 -*-
Rails.application.routes.draw do

  devise_for :admins, :skip => [:sessions, :registrations]
  as :admin do
    get 'connexion' => 'devise/sessions#new', :as => :new_admin_session
    post 'connexion' => 'devise/sessions#create', :as => :admin_session
    delete 'deconnexion' => 'devise/sessions#destroy', :as => :destroy_admin_session
  end

  scope "/admin" do
    resources :admins     , path_names: { new: 'creer', edit: 'modifier', destroy: 'supprimer' }, path: 'administrateurs'
    resources :categories , path_names: { new: 'creer', edit: 'modifier', destroy: 'supprimer' }
    resources :joueurs    , path_names: { new: 'creer', edit: 'modifier', destroy: 'supprimer' }
    resources :modes      , path_names: { new: 'creer', edit: 'modifier', destroy: 'supprimer' }


    get     'suggestions'       , to: 'suggestions#index' , as: 'suggestions'
    delete  'suggestions/purger', to: 'suggestions#purger', as: 'purger_suggestions'
  end

  get  'suggerer', to: 'suggestions#new'   , as: 'new_suggestion'
  post 'suggerer', to: 'suggestions#create', as: 'create_suggestion'

  get  'versus/configuration', to: 'versus_config#new', as: 'versus_config'
  post 'versus/configuration', to: 'versus_config#create'

  get  'versus', to: 'versus#new', as: 'versus'
  post 'versus', to: 'versus#create'

  get 'classements/:nom', to: 'application#classements',  as: 'classements'
  get 'top-20/:nom',      to: 'application#top',          as: 'top'

  root to: 'application#accueil'
end
