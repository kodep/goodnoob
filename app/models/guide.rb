class Guide < ActiveRecord::Base
  belongs_to :sub_category, required: true

  validates :header, presence: true
end

# == Schema Information
#
# Table name: guides
#
#  id              :integer          not null, primary key
#  header          :string
#  description     :text
#  video_url       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  sub_category_id :integer
#
# Indexes
#
#  index_guides_on_sub_category_id  (sub_category_id)
#
