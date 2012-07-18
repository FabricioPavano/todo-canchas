class Club < ActiveRecord::Base
  
  attr_accessible :address, :name, :phone_number, :department_id, :futbol_quantity, :tenis_quantity, :paddle_quantity, :courts_types
  attr_accessor   :futbol_quantity, :tenis_quantity, :paddle_quantity, :courts_types

  #associations
  belongs_to :department
  has_many :courts

  accepts_nested_attributes_for :courts, allow_destroy: true

  #hooks
  before_save :create_courts

  #scopes

  scope :by_department, lambda { |dep|
    joins(:department).where('departments.name = ?', dep) unless dep.nil?
  }


  #Validations


  validate :validate_court_type_presence
  validates_associated :courts
  validates :name, :address, :department_id, :presence => true



  protected
  
  def validate_court_type_presence

    #removes empty items
    @courts_types.reject! { |i| i.empty? }
    errors.add :courts_types, 'Must have at least one court type chosen' if @courts_types.empty?

  end  

  def create_courts
      
      futbol = Sport.where(:name => 'Futbol').first
      tenis  = Sport.where(:name => 'Tenis').first
      paddle = Sport.where(:name => 'Paddle').first

      unless @futbol_quantity.blank? 
        @futbol_quantity.to_i.times { self.courts.build sport_id: futbol.id }
      end

      unless @tenis_quantity.blank? 
        @tenis_quantity.to_i.times { self.courts.build sport_id: tenis.id }
      end

      unless @paddle_quantity.blank? 
        @paddle_quantity.to_i.times { self.courts.build sport_id: paddle.id }
      end             
     
    
  end

end
