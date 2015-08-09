module UsersHelper
  def gravatar_for(user, options = { size: 80 })
    digest_email = Digest::MD5::hexdigest(user.email)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{digest_email}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end
end
