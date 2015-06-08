class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @admin = admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Le compte administrateur a été créé avec succès.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: 'Les informations ont été mises à jour.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # TODO Devise registrations

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    if @admin.id == current_admin.id
      respond_to do |format|
        format.html { redirect_to admins_url, alert: 'Vous ne pouvez pas supprimer votre compte.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        @admin.destroy
        format.html { redirect_to admins_url, notice: 'Le compte administrateur a été supprimé.' }
        format.json { head :no_content }
      end
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @admin = Admin.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end
