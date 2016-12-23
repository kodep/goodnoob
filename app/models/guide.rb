class Guide < ActiveRecord::Base
  belongs_to :sub_category, required: true

  has_attached_file :image, default_url: 'bike-bg-test.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :header, presence: true

end

# == Schema Information
#
# Table name: guides
#
#  id                 :integer          not null, primary key
#  header             :string
#  description        :text
#  video_url          :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  sub_category_id    :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#
# Indexes
#
#  index_guides_on_sub_category_id  (sub_category_id)
#
