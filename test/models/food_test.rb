require 'test_helper'

class FoodTest < ActiveSupport::TestCase

  describe "an instance from YELP API" do
    before do
      @food = Food.find_food("le-petit-cochon-seattle")
    end


   it "knows its name", :vcr do
    assert_equal "Le Petit Cochon", @food.name
   end

  it "knows its phone number", :vcr do
    assert_equal "2068298943", @food.phone
  end

  it "returns an Array when asked for an address", :vcr do
    assert_instance_of Array, @food.location
  end

  it "knows its image_url", :vcr do
    assert_equal "https://s3-media1.fl.yelpcdn.com/bphoto/bKw52xkpFiXoOImoX0Enfw/ms.jpg", @food.image_url
  end

  it "knows its rating", :vcr do
    assert_equal "https://s3-media4.fl.yelpcdn.com/assets/2/www/img/c2f3dd9799a5/ico/stars/v1/stars_4.png", @food.rating_img_url
  end

  it "knows its url", :vcr do
    assert_equal "http://www.yelp.com/biz/le-petit-cochon-seattle?utm_campaign=yelp_api&utm_medium=api_v2_business&utm_source=MKgNpTNMT597GaPgrohIyA", @food.url
  end
  end
end
