#require: 'yelp'

class Food
attr_reader :name, :phone, :url, :image_url, :rating

  def initialize(data)
    @name       = data.business.name
    @phone      = data.business.phone
    @url        = data.business.url
    @image_url  = data.business.image_url
    @rating     = data.business.rating

  end

  # def new
  #   @food_suggestion = Yelp::Client.new
  # end

  def self.find_food(food_id)
    business = Yelp.client.business(food_id)
    return self.new(business)
  end

  # def business_name
  #   find_food.name
  # end
  #
  # def food_images
  #   find_food.image_url
  # end
  # #
  # def find_thumbnail
  #   return nil if find_images == []
  #   find_images.last["url"]
  # end

end
