class Info::Base < ActiveRecord::Base
  self.abstract_class = true
  self.table_name_prefix = :info_
end
