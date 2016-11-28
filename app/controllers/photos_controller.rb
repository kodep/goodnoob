# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  main        :boolean
#  comment     :text
#  day         :boolean
#  product_id  :integer
#  user_id     :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PhotosController < ApplicationController
  include ImitateDelay
  imitate_delay only: :create
  before_action :set_photo, only:[:show]
  before_action :set_product, only:[:show]

  def show
    @more_photos = @product.photos.last_photos(except:@photo, limit:7)
  end

  def create
    product = Product.find(creation_params[:product_id])
    photo = Photo.new creation_params.merge \
                      main: false, day: false, user: current_user,
                      category_id: product.category.id

    if photo.save
      redirect_to :back
    else
      render 'shared/errors', locals: { errors: photo.errors }
    end
  end

  # GET /photos/:id/edit
  def edit
    @photo = current_user.photos.find params[:id]
  end

  # PATCH /photos/:id
  def update
    @photo = current_user.photos.find params[:id]
    if @photo.update_attributes(creation_params)
      redirect_to :back
    else
      render 'shared/errors', locals: { errors: @photo.errors }
    end
  end

  # DELETE /photos/:id
  def destroy
    photo = current_user.photos.find params[:id]
    photo.destroy!
    redirect_to :back
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def set_product
    @product = @photo.product
  end

  def creation_params
    params.require(:photo).permit %i(comment product_id),
                                  picture_attributes: %i(title image)
  end
end
