# == Schema Information
#
# Table name: pictures
#
#  id                 :integer          not null, primary key
#  imageable_id       :integer
#  imageable_type     :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class PicturesController < ApplicationController
  include ImitateDelay
  imitate_delay only: [:create, :update]
  before_filter :destroy_old_picture, only: [:create, :update]

  def create
    picture = current_user.build_picture image_params
    if picture.save
      redirect_to edit_user_registration_path
    else
      render 'shared/errors', locals: { errors: picture.errors }
    end
  end

  def update
    if current_user.picture.update(image_params)
      redirect_to :back
    else
      render :edit
    end
  end

  private

  def creation_params
    params.require(:picture).permit %i(title image)
  end

  def image_params
    params.require(:picture).permit(:title, :image,
                                            :image_original_w,
                                            :image_original_h,
                                            :image_crop_x,
                                            :image_crop_y,
                                            :image_crop_w,
                                            :image_crop_h)
  end

  def destroy_old_picture
    old_picture = Picture.where(imageable_type: params[:picture][:imageable_type], imageable_id: params[:picture][:imageable_id]).last
    old_picture.destroy if old_picture
  end
end
