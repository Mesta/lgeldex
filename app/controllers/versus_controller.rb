# -*- encoding : utf-8 -*-
class VersusController < ApplicationController

  def passer
    if session[:current_user_id]["passer"]
      # decrease by 1 allow vote & reset token
      cookies[:user] = cookies[:user].to_i - 1
      session[:current_user_id]["passer"] = false

      # prepare session message
      vote = cookies[:user].to_s
      flash[:notice] = "Vous avez passé deux fois d'affilé. Il vous reste " + vote + " jeton(s) de vote."

      # redirect to a new vote
      redirect_to versus_path
    else
      # set token to true
      session[:current_user_id]["passer"] = true

      # prepare flash message
      flash[:info] = "Attention, si vous passez une seconde fois d'affilé, un jeton de vote sera consommé."

      # redirect to a new vote
      redirect_to versus_path
    end
  end

  def new
    # Check configuration of versus
    is_serious  = session[:current_user_id]["is_serious"]
    mode        = session[:current_user_id]["mode"]

    if is_serious.nil? or mode.nil?
      # if configuration is inexistant, redirect to config form
      flash[:info] = "Commencez donc par le commencement ;)"
      redirect_to versus_config_path

    else # configuration is ok

      # Set cookie if it's blank
      if cookies[:user].blank?
        cookies[:user] = {
            :value => 20,
            :expires => 1.days.from_now
        }
      else # if it exist

        # If allow vote is 0 : redirect to config form with the correct flash message
        if cookies[:user].to_i == 0
          flash[:info] = "Vous n'avez plus de jetons pour voter aujourd'hui. Repassez demain !"
          redirect_to versus_config_path

        else # else player is allow to vote

          # Check if there is enough player to vote for
          if JoueurMode.where(mode: mode).count >= 2
            # Instanciate a new form vote
            @versus = VersusForm.new(is_serious, mode)
            @versus.config()

            session[:current_user_id] = { "category"  => @versus.categorie.id,
                                          "joueur_1"  => @versus.joueur_1.id,
                                          "joueur_2"  => @versus.joueur_2.id,
                                          "is_serious" => is_serious, "mode" => mode,
                                          "passer" => session[:current_user_id]["passer"]}
          else
            flash[:info] = "Il n'y a pas encore assez de joueurs. Un peu de patience, ça va venir :-)"
            redirect_to versus_config_path
          end
        end
      end
    end
  end

  def create
    # Check if user can still vote
    if cookies[:user].to_i == 0
      flash[:info] = "Vous n'avez plus de jetons pour voter aujourd'hui. Repassez demain !"
      redirect_to versus_config_path
    end

    # Get configuration from session
    categorie   = session[:current_user_id]["category"]
    mode        = session[:current_user_id]["mode"]
    is_serious  = session[:current_user_id]["is_serious"]
    joueurs     = [ session[:current_user_id]["joueur_1"],
                    session[:current_user_id]["joueur_2"] ]

    # Instanciate a new form vote with passer parameters
    @versus = VersusForm.new(is_serious, mode)
    @versus.config(categorie, joueurs)

    # Check if submit is ok, update elo score
    if @versus.update(versus_params)

      # reset token pass to false
      session[:current_user_id]["passer"] = false

      # decrease token vote by one
      cookies[:user] = cookies[:user].to_i - 1

      # prepare flash message
      vote = cookies[:user].to_s
      redirect_to versus_path, notice: "Votre vote a été pris en compte ! Il vous reste " + vote + " jeton(s) de vote."

    else
      # if submit is not valid, redirect with a flahs message
      flash[:danger] = "Une erreur s'est produite durant le vote. Veuillez réessayer ou râler dans votre coin."
      redirect_to versus_path
    end
  end

  private
  def versus_params
    params.require(:versus_form).permit(:choix)
  end
end
