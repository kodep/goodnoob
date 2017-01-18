class Info::About < Info::Base
  validates :header, presence: true
end

# == Schema Information
#
# Table name: info_abouts
#
#  id          :integer          not null, primary key
#  header      :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
