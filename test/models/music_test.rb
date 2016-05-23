require 'test_helper'

class MusicTest < ActiveSupport::TestCase

  describe "an instance from SPOTIFY API" do

    describe "album type" do
      before do
        @album = self.find_music("0vD0IZ6ol5V30t WQRQKEb5",
          "album").first
      end

        it "knows its name", :vcr do
          assert_equal "Apples & Bananas: A Wiggly Collection of Nursery Rhymes", @album.find_name
        end

        # it "knows its image url", :vcr do
        #   assert_equal "https://i.scdn.co/image/597f7357238daf80808458073f80cf66444ca665", @album.find_thumbnail
        # end
        #
        # it "knows its type", :vcr do
        #   assert_equal "album", @album.type
        # end
        #
        # it "knows its iframe", :vcr do
        #   assert_equal "spotify:album:0vD0IZ6ol5V30tWQRQKEb5", @album.iframe
        # end
        #
        # it "knows its url", :vcr do
        #   assert_equal "https://open.spotify.com/album/0vD0IZ6ol5V30tWQRQKEb5", @album.open_url
        # end
    end
  end
end
