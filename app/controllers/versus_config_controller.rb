class VersusConfigController < ApplicationController
  
  def new
    session[:current_user_id] = {"is_serious" => nil }
    @versus_config = VersusConfigForm.new
  end

  def create
    @versus_config = VersusConfigForm.new

    if @versus_config.update(versus_config_params)
      session[:current_user_id] = { "is_serious" => @versus_config.is_serious,  "mode" => @versus_config.mode }
      redirect_to versus_path
    else
      flash[:danger] = "La configuration a échoué. On recommence !"
      redirect_to versus_config_path
    end
  end

  private
  def versus_config_params
    params.require(:versus_config_form).permit(:is_serious, :mode)
  end
end
