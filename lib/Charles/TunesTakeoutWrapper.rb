require 'httparty'

module Charles
 class CharlesTunesTakeout
   BASE_URL = "https://tunes-takeout-api.herokuapp.com/v1/suggestions/search?query="

   attr_reader :suggestions

   def initialize(data)
     @suggestions = data["suggestions"]
   end

   def self.find_suggestions(term)
    data = HTTParty.get(BASE_URL + "#{term}").parsed_response
    return self.new(data)
   end

  #  private
   #
  #  def reject_null_sprites(sprite_hash)
  #    sprite_hash.reject do |name, url|
  #      url.nil?
  #    end
  #  end
 end
end
