require: 'yelp'

class Food
attr_reader :food_suggestion

  def new
    @food_suggestion = Yelp::Client.new
  end

  def find_food(food_id)
    @food_suggestion.business(food_id)
  end

  def business_name
    find_food.name
  end

  def food_images
    find_food.image_url
  end
  #
  # def find_thumbnail
  #   return nil if find_images == []
  #   find_images.last["url"]
  # end
  #
  # def find_name
  #     music_suggestion.name
  # end
end
