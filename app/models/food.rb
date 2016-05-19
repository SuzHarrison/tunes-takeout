# require: 'yelp'

class Food
attr_reader :food_suggestion

  def new
    @food_suggestion = Yelp::Client.new
  end

  def find_food_images
      food_suggestion.images
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
