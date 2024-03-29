# -*- encoding : utf-8 -*-
class ModesController < ApplicationController
  before_action :set_mode, only: [:show, :edit, :update, :destroy]

  # GET /modes
  # GET /modes.json
  def index
    @modes = Mode.all
  end

  # GET /modes/1
  # GET /modes/1.json
  def show
  end

  # GET /modes/new
  def new
    @mode = Mode.new
  end

  # GET /modes/1/edit
  def edit
  end

  # POST /modes
  # POST /modes.json
  def create
    @mode = Mode.new(mode_params)

    respond_to do |format|
      if @mode.save
        format.html { redirect_to @mode, notice: 'Le mode de jeu a ?t? cr?? avec succ?s.' }
        format.json { render :show, status: :created, location: @mode }
      else
        format.html { render :new }
        format.json { render json: @mode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modes/1
  # PATCH/PUT /modes/1.json
  def update
    respond_to do |format|
      if @mode.update(mode_params)
        format.html { redirect_to @mode, notice: 'Le mode de jeu a ?t? mis ? jour.' }
        format.json { render :show, status: :ok, location: @mode }
      else
        format.html { render :edit }
        format.json { render json: @mode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modes/1
  # DELETE /modes/1.json
  def destroy
    @mode.destroy
    respond_to do |format|
      format.html { redirect_to modes_url, notice: 'Le mode de jeu a ?t? supprim?.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mode
      @mode = Mode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mode_params
      params.require(:mode).permit(:nom)
    end
end
