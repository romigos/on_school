class Admin::Api::TinymceImagesController < Admin::Api::BaseController
  respond_to :json

  def create
    image = TinymceImage.new(tinymce_image_params)
    if image.save
      render json: {image: {url: image.file.url}}
    else
      render json: {error: {message: image.errors.full_messages.join(', ')}}
    end
  end

  private

  def tinymce_image_params
    params.permit(:file)
  end
end
