class Filter < ActiveRecord::Base
  has_many :filter_options
  belongs_to :sub_category

  accepts_nested_attributes_for :filter_options, allow_destroy: true
end

# == Schema Information
#
# Table name: filters
#
#  id              :integer          not null, primary key
#  sub_category_id :integer
#  name            :string
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_filters_on_sub_category_id  (sub_category_id)
#
# Foreign Keys
#
#  fk_rails_58c4041a3b  (sub_category_id => sub_categories.id)
#
