class Club < ActiveRecord::Base
  
  attr_accessible :address, :name, :phone_number, :department_id, :futbol_quantity, :tenis_quantity, :paddle_quantity, :courts_types, :photo
  attr_accessor   :futbol_quantity, :tenis_quantity, :paddle_quantity, :courts_types, :virtual

  #associations
  belongs_to :department
  has_many :courts, :dependent => :destroy
  has_many :pictures 

  accepts_nested_attributes_for :courts, allow_destroy: true


  #playing


  #hooks
  before_save :create_courts

  #scopes

  scope :by_department, lambda { |dep|
    joins(:department).where('departments.id = ?', dep) unless dep.nil?
  }

  scope :by_department, lambda { |dep|
    joins(:department).where('departments.id = ?', dep) unless dep.nil?
  }
  

  #Validations


  validate :validate_court_type_presence
  validates_associated :courts
  validates :name, :address, :department_id, :presence => true

  def validate_court_type_presence

    if(@courts_types.nil?)
      return
    end  

    #removes empty items
    @courts_types.reject! { |i| i.empty? } 
    if @courts_types.empty?
      errors.add :courts_types, 'Must have at least one court type chosen' 
    end  
  end
  
  #Virtual Attr

  def courts_types
    court_quantity.keys
  end  

  def futbol_quantity
    court_quantity 'futbol'
  end

  def tenis_quantity
    court_quantity 'tenis'
  end

  def paddle_quantity
    court_quantity 'paddle'
  end

  #Custom Functions

  def has_futbol_courts?
    courts_types.include? 'futbol'
  end

  def has_tenis_courts?
    courts_types.include? 'tenis'
  end

  def has_paddle_courts?
    courts_types.include? 'paddle'
  end

  #returns how many courts of the sport passed as parameter the club has
  #if no parameter is sent it passes all quantities
  def court_quantity sport=nil
    
    if @sports.blank?
      @sports = self.courts.includes(:sport).map {|c| c.sport.name }
    end
      
    qty_hash = Hash.new 0

    @sports.each do |sp|
      qty_hash[sp.downcase] += 1
    end

    return qty_hash[sport.downcase] unless sport.blank?
    
    qty_hash

  end

   
  #Creates or destroy courts to match the quantity indicated by the user
  #Can be refactored

  def create_courts
      futbol = Sport.where(:name => 'futbol').first
      tenis  = Sport.where(:name => 'Tenis').first
      paddle = Sport.where(:name => 'Paddle').first

      # court_quantity '*' indicates how many courts already has
      # @*_quantity indicates how many tha user wants

      ### Futbol Courts
      diffFutbol = court_quantity('futbol') - @futbol_quantity.to_i 

      if(diffFutbol > 0)
        diffFutbol.times { self.courts.delete(self.courts.where('sport_id = ?',futbol.id).last)}
      end

      if(diffFutbol < 0)
        diffFutbol.abs.times { self.courts.build sport_id: futbol.id }
      end


      ### Tenis Courts

      diffTenis = court_quantity('tenis') - @tenis_quantity.to_i 

      if(diffTenis > 0)
        diffTenis.times { self.courts.delete(self.courts.where('sport_id = ?',tenis.id).last)}
      end

      if(diffTenis < 0)
        diffTenis.abs.times { self.courts.build sport_id: tenis.id }
      end

      ### Paddle Courts

      diffPaddle = court_quantity('paddle') - @paddle_quantity.to_i 

      if(diffPaddle > 0)
        diffPaddle.times { self.courts.delete(self.courts.where('sport_id = ?',paddle.id).last)}
      end

      if(diffPaddle < 0)
        diffPaddle.abs.times { self.courts.build sport_id: paddle.id }
      end         
  end

end