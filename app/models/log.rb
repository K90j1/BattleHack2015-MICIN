class Log < ActiveRecord::Base
  self.inheritance_column = nil
  attr_accessible :type, :log, :resolve
  validates :type,  :presence=> true, :length=> { :maximum=> 50 }
end
