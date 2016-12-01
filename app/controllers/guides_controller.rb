class GuidesController < ApplicationController
  before_action :set_sub_category, only: [:show]
  before_action :set_guide, only: [:show]

  def show
  end

  private

  def set_sub_category
    @sub_category = SubCategory.includes(:guides).find(params[:sub_category_id])
  end

  def set_guide
    @guide = Guide.find(params[:id])
  end
end

