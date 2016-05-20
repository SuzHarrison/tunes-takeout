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

  def favorites
    @favorites = TunesTakeoutWrapper.favorites_by_user(params["current_user"])
  end

  def favorite
    # adds a suggestion into the favorite list for the signed-in User. This requires interaction with the Tunes & Takeout API.
    @favorite = TunesTakeoutWrapper.make_favorite(params["current_user"], params["favorite"])
    redirect_to root_path
  end

  def unfavorite
    # removes a suggestion from the favorite list for the signed-in User. This requires interaction with the Tunes & Takeout API.
    @favorite = TunesTakeoutWrapper.unfavorite(params[:favorite])
  end
end
