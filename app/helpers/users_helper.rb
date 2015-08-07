module UsersHelper
  def gravatar_for(user)
    digest_email = Digest::MD5::hexdigest(user.email)
    gravatar_url = "https://secure.gravatar.com/avatar/#{digest_email}"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end
end
