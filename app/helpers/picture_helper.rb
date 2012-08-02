module PictureHelper
  def sample_file(filename = "default.png")
    File.new("pictures/#{filename}")
  end
end
