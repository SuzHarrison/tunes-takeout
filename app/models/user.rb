class User < ActiveRecord::Base
  validates :uid, :provider, presence: true

  def self.find_or_create_from_omniauth(auth_hash)
    user = self.find_by(uid: auth_hash["info"]["id"], provider: auth_hash["provider"])
      if !user.nil?
        return user
      else
        user = User.new
        user.uid = auth_hash["info"]["id"]
        user.provider = auth_hash["provider"]
        user.name = auth_hash["info"]["display_name"]
        user.photo_url = auth_hash["info"]['images'][0]["url"]
        if user.save
          return user
        else
          return nil
        end
      end
  end


  # def favorite(user_id, pairing)
  #   # find User by id and save favorite pairing
  # end
  #
  # def user_favorites
  #
  # end
  #
  # def unfavorite
  #
  # end

end
