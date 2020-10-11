class SearchController < ApplicationController
  def search
    search_type = params[:search_type].to_i
    search_term = params[:search_term]
    puts "Got search request for #{search_term}, of type #{search_type}"
    @results = case search_type
               when 1
                 Film.search(search_term)
               when 2
                 Planet.search(search_term)
               when 3
                 Species.search(search_term)
               else
                 Film.search(search_term) + Planet.search(search_term) + Species.search(search_term)
               end
  end
end
