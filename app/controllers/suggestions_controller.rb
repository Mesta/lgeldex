# -*- encoding : utf-8 -*-
class SuggestionsController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :purger]

  def search
    if params["suggestion"].nil?
      @search = ""
    else
      @search = suggestion_params["pseudo"]
      @suggestions = Suggestion.where("pseudo LIKE ?", "%#{@search}%")
    end
    render "search"
  end

  def soutenir
    # Check if cookie already exist
    if cookies[:soutien].blank?
      cookies[:soutien] = {
          :value   => "",
          :expires => 1.year.from_now
      }
    end

    # Get pseudo param
    pseudo = params["pseudo"]

    # if user already vote for this pseudo : redirect and alert error message
    if cookies[:soutien].include? pseudo
      redirect_to search_suggestion_path, alert: "Vous ne pouvez pas apporter votre soutien à #{pseudo} plus d'une fois."
    else
      # else, increase nb_vote, save and redirect
      suggestion          = Suggestion.find_by_pseudo(pseudo)
      suggestion.nb_vote  = suggestion.nb_vote + 1

      if suggestion.save
        redirect_to search_suggestion_path, notice: "Vous avez apporté votre soutien à #{pseudo} !"
        cookies[:soutien] = cookies[:soutien] + pseudo + ";"
      else
        redirect_to search_suggestion_path, alert: "Une erreur est survenue... désolé :-("
      end
    end

  end

  # GET /suggestions
  # GET /suggestions.json
  def index
    @suggestions = Suggestion.order(nb_vote: :DESC)
  end

  # GET /suggestions/new
  def new
    @suggestion = Suggestion.new
    @suggestion.modes.build
  end

  # POST /suggestions
  # POST /suggestions.json
  def create
    @suggestion = Suggestion.new(suggestion_params)

    if @suggestion.save
      flash[:notice] = "Votre suggestion est bien arrivée ! Merci :-)"
      redirect_to search_suggestion_path
    else
      render :new
    end
  end

  def purger
    suggestions = Suggestion.all
    if not suggestions.nil?
      suggestions.each do |sugg|
        sugg.destroy
      end
    end

    redirect_to suggestions_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_suggestion
    @suggestion = Suggestion.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def suggestion_params
    params.require(:suggestion).permit(:pseudo, { mode_ids: [] })
  end
end
