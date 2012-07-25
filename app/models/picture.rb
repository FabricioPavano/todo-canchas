class Picture < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  belongs_to :club
  attr_accessible :picture, :club_id
  mount_uploader :picture, PictureUploader

  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    {
      "name" => read_attribute(:picture),
      "size" => picture.size,
      "url" => picture.url,
      "thumbnail_url" => picture.thumb.url,
      "delete_url" => picture_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end

end
