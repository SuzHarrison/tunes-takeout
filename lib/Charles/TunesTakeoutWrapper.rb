require 'httparty'

module Charles
 class CharlesTunesTakeout
   BASE_URL = "https://tunes-takeout-api.herokuapp.com/"

   attr_reader :suggestions

   def initialize(data)
     @suggestions = data["suggestions"]
   end

   def self.find_suggestions(term)
    data = HTTParty.get(BASE_URL + "v1/suggestions/search?query=#{term}").parsed_response
    return self.new(data)
   end

   def self.top_twenty
    data = HTTParty.get(BASE_URL + "v1/suggestions/top?limit=20").parsed_response["suggestions"]
    return data
   end

   def self.search_by_id(suggestion_id)
     data = HTTParty.get(BASE_URL + "v1/suggestions/#{suggestion_id}").parsed_response["suggestion"]
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
