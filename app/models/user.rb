class User < ActiveRecord::Base
  validates :email, :name, :uid, :provider, presence: true

  def self.find_or_create_from_omniauth(auth_hash)
    # user = self.find_by(uid: auth_hash["uid"], provider: auth_hash["provider"])
    #   if !@user.nil?
    #     return user
    #   else
        #no user founds, do something here
        user = User.new
        user.uid = auth_hash["uid"]
        user.provider = auth_hash["provider"]
        user.name = auth_hash["info"]["name"]
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
