Rails.application.routes.draw do

  devise_for :admins, :skip => [:sessions, :registrations]
  as :admin do
    get 'connexion' => 'devise/sessions#new', :as => :new_admin_session
    post 'connexion' => 'devise/sessions#create', :as => :admin_session
    delete 'deconnexion' => 'devise/sessions#destroy', :as => :destroy_admin_session
  end

  scope "/admin" do
    resources :admins    , path_names: { new: 'creer', edit: 'modifier', destroy: 'supprimer' }, path: 'administrateurs'
    resources :categories, path_names: { new: 'creer', edit: 'modifier', destroy: 'supprimer' }
    resources :joueurs   , path_names: { new: 'creer', edit: 'modifier', destroy: 'supprimer' }

    get     'suggestions'       , to: 'suggestions#index' , as: 'suggestions'
    delete  'suggestions/purger', to: 'suggestions#purger', as: 'purger_suggestions'
  end

  get  'suggerer', to: 'suggestions#new'   , as: 'new_suggestion'
  post 'suggerer', to: 'suggestions#create', as: 'create_suggestion'

  get  'versus', to: 'versus#new', as: 'versus'
  post 'versus', to: 'versus#create'

  get 'classements', to: 'application#classements', as: 'classements'

  get 'a-propos', to: 'application#about', as: 'about'

  root to: 'application#accueil'
end
