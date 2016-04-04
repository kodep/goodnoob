class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
end

# == Schema Information
#
# Table name: categories
#
#  id                 :integer          not null, primary key
#  name               :string
#  father_category_id :integer
#
