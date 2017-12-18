module UserHelper
    
   # def avatar_url(user)
    #    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
            #gravatar_url = "#{root_url}images/guest.png"
            #gravatar_id = user.id
            #size = options[:size]
            #gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
     #       "http://gravatar.com/avatar/#{gravatar_id}.png"
            #image_tag(gravatar_url, alt: user.id, class: "img-circle")
#    end
    
    
    def gravatar_for(user, options = { size: 20})
        if user.email?
            gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
            gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
            image_tag(gravatar_url, alt: user.full_name, class: "img-circle")
        else
            image_tag("/img/avatar_default.png", alt: user.full_name, class: "gravatar")
        end
    end 
end