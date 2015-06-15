class Log < ActiveRecord::Base
  self.inheritance_column = nil
	belongs_to :user
  validates :type,  :presence=> true, :length=> { :maximum=> 50 }
  validates :log,  :presence=> true
  validates :resolve,  :presence=> true
end
