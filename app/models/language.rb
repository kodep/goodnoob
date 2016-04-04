class Language < ActiveRecord::Base
  has_many :users
  has_many :reviews
end

# == Schema Information
#
# Table name: languages
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
