class Attribute < ActiveRecord::Base
  belongs_to :product
end

# == Schema Information
#
# Table name: attributes
#
#  id         :integer          not null, primary key
#  title      :string
#  value      :text
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
