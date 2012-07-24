class Club < ActiveRecord::Base
  
  attr_accessible :address, :name, :phone_number, :department_id, :futbol_quantity, :tenis_quantity, :paddle_quantity, :courts_types, :photo
  attr_accessor   :futbol_quantity, :tenis_quantity, :paddle_quantity, :courts_types, :virtual
  mount_uploader :photo, PhotoUploader

  #associations
  belongs_to :department
  has_many :courts

  accepts_nested_attributes_for :courts, allow_destroy: true


  #playing


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

  def validate_court_type_presence

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

  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    {
      "name" => read_attribute(:photo),
      "size" => self.size,
      "url" => self.url,
      "thumbnail_url" => self.thumb.url,
      "delete_url" => photo_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end
end