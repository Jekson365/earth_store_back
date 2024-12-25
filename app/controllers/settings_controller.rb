class SettingsController < ApplicationController
  def update_settings
    settings = params[:settings]
    settings.each do |e|
      current = Setting.find_by(param_name: e['param_name'])
      current.status = e['status']
      current.save
    end
    render json: 'updated!'
  end
  def index
    render json: Setting.all
  end
  private
  def settings_params
    params.permit(:settings)
  end
end
