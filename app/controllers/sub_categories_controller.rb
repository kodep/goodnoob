# == Schema Information
#
# Table name: sub_categories
#
#  id          :integer          not null, primary key
#  name        :string
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SubCategoriesController < ApplicationController
  def show
    @sub_category = SubCategory.find(params[:id])

    @products = @sub_category.products
                  .filter(params[:filters])
                  .companies(params[:companies])
                  .year_from(params[:year_from])
                  .year_to(params[:year_to])
                  .price_from(params[:price_from])
                  .price_to(params[:price_to])
                  .sort_by(params[:search_field], params[:search_direction])
                  .page(params[:page])
                  .per(16)

    @filters = @sub_category.filters

    @categories = Category.includes(:sub_categories).all

    respond_to do |format|
      format.js { render 'success', layout: false }
      format.html
    end
  end
end
