class Guide < ActiveRecord::Base
end

# == Schema Information
#
# Table name: guides
#
#  id          :integer          not null, primary key
#  header      :string
#  description :text
#  video_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
