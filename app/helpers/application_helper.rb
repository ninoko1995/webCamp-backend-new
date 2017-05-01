module ApplicationHelper
	def profile_url(user)
    if user.image?
      return user.image.profile
    else
      return '/no-image.jpg'
    end
  end

  def profile_url_thumb(user)
    if user.image?
      return user.image.thumb
    else
      return '/no-image-icon.jpg'
    end
  end

  
  def header_url(user)
    if user.header_image?
      return user.header_image_url.to_s 
    else
      return '/no-image-header.jpg'
    end
  end

   def header_url_tl(user)
    if user.header_image?
      return user.header.image.tl.to_s 
    else
      return '/no-image-header-tl.jpg'
    end
  end

  def modal_url(user)
     if user.image?
      return user.image_url.to_s
    else
      return '/no-image-modal.jpg'
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
