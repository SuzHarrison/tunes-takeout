#require: 'yelp'

class Food
attr_reader :name, :phone, :url, :image_url, :rating, :rating_img_url, :location

  def initialize(data)
    @name               = data.business.name
    @phone              = data.business.phone
    @url                = data.business.url
    @image_url          = data.business.image_url
    @rating_img_url     = data.business.rating_img_url
    @rating             = data.business.rating
    @location           = data.business.location.display_address
  end

  # def new
  #   @food_suggestion = Yelp::Client.new
  # end

  def self.find_food(food_id)
    business = Yelp.client.business(food_id)
    return self.new(business)
  end
end
