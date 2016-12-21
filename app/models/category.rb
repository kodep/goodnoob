class Category < ActiveRecord::Base
  belongs_to :father_category
  has_many :sub_categories
  has_many :videos
  has_many :photos
  has_many :products, through: :sub_categories
  has_many :companies, through: :products

  has_many :user_favourites, as: :favouriteable
  has_many :users, through: :user_favourites

  scope :with_guides, -> { where id: SubCategory.with_guides.map(&:category_id).uniq }

  # Searched by subcategories
  def searched_for?(sub_categories_ids)
    sub_categories_ids ||= []
    (sub_categories.ids - sub_categories_ids.map(&:to_i)).count < sub_categories.ids.count
  end

  # Searched by subcategories but not for all
  def searched_not_for_all?(sub_categories_ids)
    searched_for?(sub_categories_ids) && (sub_categories.ids - sub_categories_ids.map(&:to_i)).count > 0
  end

end

# == Schema Information
#
# Table name: categories
#
#  id                 :integer          not null, primary key
#  name               :string
#  father_category_id :integer
#  image              :string
#
