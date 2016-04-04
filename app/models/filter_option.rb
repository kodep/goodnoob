class FilterOption < ActiveRecord::Base
  belongs_to :filter

  has_and_belongs_to_many :products
end

# == Schema Information
#
# Table name: filter_options
#
#  id         :integer          not null, primary key
#  filter_id  :integer
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_filter_options_on_filter_id  (filter_id)
#
# Foreign Keys
#
#  fk_rails_db2df53c0e  (filter_id => filters.id)
#
