require 'rspotify'

class Music
attr_reader :music_suggestion

# def initialize(data)
#   @music_suggestion = data["music_suggestion"]
#   @id = data["id"]
#
#
# end

  def find_music(id, music_type)
    if music_type == "artist"
      @music_suggestion = RSpotify::Artist.find(id)
    elsif music_type == "track"
      @music_suggestion = RSpotify::Track.find(id)
    elsif music_type == "album"
      @music_suggestion = RSpotify::Album.find(id)
    else music_type == "playlist"
      @music_suggestion = RSpotify::Playlist.find(id)
    end
    return self
  end

  def find_images
    if music_suggestion.type == "artist" || music_suggestion.type == "album"
      music_suggestion.images
    else
      []
    end
  end

  def find_thumbnail
    return nil if find_images == []
    find_images.last["url"]
  end

  def find_name
      music_suggestion.name
  end

  def open_url
    music_suggestion.external_urls
  end
end
