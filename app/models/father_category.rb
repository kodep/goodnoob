class FatherCategory < ActiveRecord::Base
  has_many :categories
end

# == Schema Information
#
# Table name: father_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
