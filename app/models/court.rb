class Court < ActiveRecord::Base
  belongs_to :sport
  belongs_to :club

  validates :sport_id, :club_id, :presence => true
  attr_accessible :club, :sport
end
