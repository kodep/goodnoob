class Distributor < ActiveRecord::Base
  has_many :pos, class_name: 'POS'
  has_many :companies, through: :pos

  has_one :address, as: :addressable

  accepts_nested_attributes_for :address

end

# == Schema Information
#
# Table name: distributors
#
#  id          :integer          not null, primary key
#  information :text
#  phone       :string
#  url         :string
#  email       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
