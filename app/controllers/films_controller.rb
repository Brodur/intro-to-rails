class FilmsController < ApplicationController
  def index
    @films = Film.order("episode ASC")
  end

  def show
    @film = Film.find(params[:id])
  end

  def self.search(search_term)
    where("LOWER(title) LIKE ?", "%#{search_term.downcase}%")
  end
end
