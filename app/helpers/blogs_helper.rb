module BlogsHelper

  def avatar(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url =  "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag gravatar_url, width: 60
end
  
end
