class VersusController < ApplicationController

  def new
    is_serious = session[:current_user_id]["is_serious"]
    if is_serious.nil?
      flash[:info] = "Commencez donc par le commencement ;)"
      redirect_to versus_config_path
    end

    @versus = VersusForm.new(is_serious)
    @versus.config()

    session[:current_user_id] = { "category"  => @versus.categorie.id,
                                  "joueur_1"  => @versus.joueur_1.id,
                                  "joueur_2"  => @versus.joueur_2.id,
                                  "is_serious" => is_serious }
  end

  def create

    categorie = session[:current_user_id]["category"]
    joueurs = [ session[:current_user_id]["joueur_1"], session[:current_user_id]["joueur_2"] ]
    is_serious = session[:current_user_id]["is_serious"]

    @versus = VersusForm.new(is_serious)
    @versus.config(categorie, joueurs)

    if @versus.update(versus_params)
      redirect_to versus_path, notice: "Votre vote a été pris en compte !"
    else
      flash[:danger] = "Votre vote n'a pas été pris en compte ;-)"
      redirect_to versus_path
    end
  end

  private
  def versus_params
    params.require(:versus_form).permit(:choix)
  end
end
