class OpeningImagesController < ApplicationController
  def remove_image
    opening_image = OpeningImage.find(remove_image_id[:id])

    if opening_image.destroy
      render json: opening_image
    end
  end
  private
  def remove_image_id
    params.permit(:id)
  end
end
