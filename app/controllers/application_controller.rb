class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def accueil
  end

  def classements
    mode = params["nom"]
    byebug
    @classements = Category.includes(:joueur_modes_category).joins(joueur_modes_category: :joueur_mode)

    @classements = JoueurMode.includes(:joueur).joins(:mode).where('modes.nom' => mode)

    #joueur_mode_id: JoueurMode.
    #    where(mode_id: Mode.where(nom: params["nom"])))

  end

  def about
  end
end
