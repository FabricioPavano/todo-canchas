class Club < ActiveRecord::Base
  belongs_to :department
  has_many :courts

  #Validations
  validates_associated :courts
  validates :name, :address, :department_id, :presence => true

  attr_accessible :address, :name, :phone_number, :department_id
end
