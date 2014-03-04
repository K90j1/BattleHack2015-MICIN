class Log < ActiveRecord::Base
  self.inheritance_column = nil
  attr_accessible :type, :log, :resolve, :url
  validates :type,  :presence=> true, :length=> { :maximum=> 50 }
  validates :log,  :presence=> true
  validates :resolve,  :presence=> true
end
