class VersusController < ApplicationController

  def new

    @versus = VersusForm.new
    session[:current_user_id] = [ @versus.categorie.id, @versus.joueur_1.id, @versus.joueur_2.id ]
  end

  def create
    categorie = session[:current_user_id][0]
    joueurs = [ session[:current_user_id][1], session[:current_user_id][2] ]

    @versus = VersusForm.new(categorie, joueurs)

    if @versus.update(versus_params)
      redirect_to versus_path, notice: "Vote pris en compte !"
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
