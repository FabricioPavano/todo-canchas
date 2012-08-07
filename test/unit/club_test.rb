require 'test_helper'
 
class ClubTest < ActiveSupport::TestCase
  
  def setup
    load "#{Rails.root}/db/seeds.rb" if Department.first.nil?
  end

  test "should not save club without courts" do
    club = Club.new
    club.name = 'Club1'
    club.department_id = Department.first.id
    club.address = 'Adress1'
    club.futbol_quantity = 1

    assert_equal true, club.valid?,  'Club is valid without courts'
  end

end