class SuggestionsController < ApplicationController
  require "#{Rails.root}/lib/Charles/TunesTakeoutWrapper.rb"

BEST_PAIRINGS = 20

  def search_term
    @results = Charles::CharlesTunesTakeout.find_suggestions(params[:search_request])
      # if @suggestions == nil
      #   flash[:no_results] = "Sorry we have no results for this search."
      #   redirect_to root_path
      # else
      #   return @results
      # end
  end
  #
  # def display_results
  #   @results =
  # end

  # def index
  #   @pairings = #CHARLESAPI.pairings.all.order(:rank).reverse.take(BEST_PAIRINGS)
  # end
end
