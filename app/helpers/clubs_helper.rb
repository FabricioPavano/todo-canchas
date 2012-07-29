module ClubsHelper 

  # hide_*_quantity? methods allow quantity fields to appear in correct
  # state when editing a club 

  def hide_futbol_quantity?(club) 
    return { :class => 'hidden' } unless club.has_futbol_courts?
  end

  def hide_tenis_quantity?(club) 
    return { :class => 'hidden' } unless club.has_tenis_courts?
  end

  def hide_paddle_quantity?(club) 
    return { :class => 'hidden' } unless club.has_paddle_courts?
  end

  def titleize_array(ary)
    ary.map { |item| item.capitalize }  
  end



end
