# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def accueil
  end

  def classements
    mode = params["nom"]
    @classements = Hash.new

    Category.order(is_serious: :DESC, nom: :ASC).each do |categorie|
      @classements[categorie.nom] = JoueurModesCategory
                                        .joins(joueur_mode: :mode)
                                        .includes(joueur_mode: :joueur)
                                        .where("modes.nom" => mode, category_id: categorie.id)
                                        .order(elo: :DESC)
    end
  end

  def about
  end
end
