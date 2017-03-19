module ApplicationHelper
	def profile_url(user)
    if user.image?
      return user.image_url.to_s 
    else
      return '/no_image.jpg'
    end
  end


  
  def profile_url_thumb(user)
    if user.image?
      return user.image.thumb
    else
      return '/no-image-icon.jpg'
    end
  end


  def correct_user?(user)
  	if current_user.nil?
  		return false
  	else
  		user.id.equal?(current_user.id)
  	end
  end
end
