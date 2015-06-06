class JoueursController < ApplicationController
  before_action :set_joueur, only: [:show, :edit, :update, :destroy]

  # GET /joueurs
  # GET /joueurs.json
  def index
    @joueurs = Joueur.all
  end

  # GET /joueurs/1
  # GET /joueurs/1.json
  def show
  end

  # GET /joueurs/new
  def new
    @joueur = Joueur.new
  end

  # GET /joueurs/1/edit
  def edit
  end

  # POST /joueurs
  # POST /joueurs.json
  def create
    @joueur = Joueur.new(joueur_params)

    respond_to do |format|
      if @joueur.save
        format.html { redirect_to @joueur, notice: 'Joueur was successfully created.' }
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
        format.html { redirect_to @joueur, notice: 'Joueur was successfully updated.' }
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
      format.html { redirect_to joueurs_url, notice: 'Joueur was successfully destroyed.' }
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
      params[:joueur]
    end
end