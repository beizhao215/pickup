module NewbiesHelper
   # Returns the Gravatar (http://gravatar.com/) for the given user.
    def gravatar_for(newbie)
      gravatar_id = Digest::MD5::hexdigest(newbie.email.downcase)
      gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png"
      image_tag(gravatar_url, alt: newbie.name, class: "gravatar")
    end
  end