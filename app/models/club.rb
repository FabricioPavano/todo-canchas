class Club < ActiveRecord::Base
  
  attr_accessible :address, :name, :phone_number, :department_id, :futbol_quantity, :tenis_quantity, :paddle_quantity, :courts_types
  attr_accessor   :futbol_quantity, :tenis_quantity, :paddle_quantity, :courts_types

  #associations
  belongs_to :department
  has_many :courts

  accepts_nested_attributes_for :courts, allow_destroy: true

  #hooks
  before_save :create_courts



  #Validations


  validate :mi_validator
  validates_associated :courts
  validates :name, :address, :department_id, :presence => true



  protected
  
  def mi_validator

    #removes empty items
    @courts_types.reject! { |i| i.empty? }

    errors.add :courts_types, 'Must have at least one sport chosen' if @courts_types.empty?

  end  

  def create_courts

      #debugger 
      
    
  end

end
