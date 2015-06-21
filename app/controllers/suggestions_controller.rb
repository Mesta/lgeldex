# -*- encoding : utf-8 -*-
class SuggestionsController < ApplicationController
    # GET /suggestions
  # GET /suggestions.json
  def index
    @suggestions = Suggestion.all
  end

  # GET /suggestions/new
  def new
    @suggestion = Suggestion.new
  end

  # POST /suggestions
  # POST /suggestions.json
  def create
    @suggestion = Suggestion.new(suggestion_params)

    if @suggestion.save
      flash[:notice] = "Votre suggestion est bien arrivée ! Merci :-)"
      redirect_to new_suggestion_path
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
      params.require(:suggestion).permit(:pseudo)
    end
end
