module UsersHelper
  def mini_avatar_for(user)
  	image_tag(user.profile_photo_url(:mini), alt: user.name, class: "mini-avatar") if user.profile_photo_url
  end

  def avatar_for(user)
  	if user.profile_photo_url
  		image_tag(user.profile_photo_url(:thumb), alt: user.name)
  	else
  		gravatar_for(user)
  	end
  end

  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
