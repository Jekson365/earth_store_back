class ContactInfosController < ApplicationController
  def index
    contact_infos = ContactInfo.first
    render json: contact_infos
  end

  def update
    contact_info = ContactInfo.find(contact_info_params[:id])
    if contact_info.update(contact_info_params)
      render json: contact_info
    end
  end

  private

  def contact_info_params
    params.permit(:email, :phone_number, :location,:id)
  end
end
