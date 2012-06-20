class Club < ActiveRecord::Base
  belongs_to :department
  attr_accessible :address, :name, :phone_number, :department_id
end
