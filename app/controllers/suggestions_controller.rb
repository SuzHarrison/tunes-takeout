class SuggestionsController < ApplicationController
  # require "#{Rails.root}/lib/Charles/TunesTakeoutWrapper.rb"

  def search_term
    @results = TunesTakeoutWrapper.find_suggestions(params[:search_request])
      # if @suggestions == nil
      #   flash[:no_results] = "Sorry we have no results for this search."
      #   redirect_to root_path
      # else
      #   return @results
      # end
  end

  def favorites(data)
    @favorites = data.all

  end

  def favorite(uid, suggestions_id)
    # adds a suggestion into the favorite list for the signed-in User. This requires interaction with the Tunes & Takeout API.
    @favorites = TunesTakeoutWrapper.(params [:favorite_hash])
  end

  def unfavorite
    # removes a suggestion from the favorite list for the signed-in User. This requires interaction with the Tunes & Takeout API.
  end
end
