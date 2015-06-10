class JoueursController < ApplicationController
  before_action :set_joueur, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  # GET /joueurs
  # GET /joueurs.json
  def index
    @joueurs = Joueur.all
  end

  # GET /joueurs/1
  # GET /joueurs/1.json
  def show
    @classements = JoueurCategory.where(joueur_id: @joueur.id)
  end

  # GET /joueurs/new
  def new
    @joueur = Joueur.new
    @joueur.categories.build
  end

  # GET /joueurs/1/edit
  def edit
  end

  # POST /joueurs
  # POST /joueurs.json
  def create
    @joueur = Joueur.new(joueur_params)
    Category.all.each do |category|
      tmp = JoueurCategory.create category: category, joueur: @joueur, elo: 1200
    end

    respond_to do |format|
      if @joueur.save
        sugg = Suggestion.where(pseudo: joueur_params["pseudo"]).first
        if not sugg.blank?
          sugg.destroy
        end

        format.html { redirect_to @joueur, notice: 'Le joueur a été créé avec succès.' }
        format.json { render :show, status: :created, location: @joueur }
      else
        format.html { render :new }
        format.json { render json: @joueur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /joueurs/1
  # PATCH/PUT /joueurs/1.json
  def update
    respond_to do |format|
      if @joueur.update(joueur_params)
        format.html { redirect_to @joueur, notice: 'Les informations ont été mises à jour.' }
        format.json { render :show, status: :ok, location: @joueur }
      else
        format.html { render :edit }
        format.json { render json: @joueur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /joueurs/1
  # DELETE /joueurs/1.json
  def destroy
    @joueur.destroy
    respond_to do |format|
      format.html { redirect_to joueurs_url, notice: 'Le joueur a été supprimé.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_joueur
      @joueur = Joueur.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def joueur_params
      params.require(:joueur).permit(:pseudo, :is_active)
    end
end
