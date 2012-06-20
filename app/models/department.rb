class Department < ActiveRecord::Base
  has_many :clubs
  attr_accessible :name

  validates :name, :presence => true

end
