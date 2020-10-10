class FilmsController < ApplicationController
  def index
    @films = Film.order("episode ASC")
  end

  def show
    @film = Film.find(params[:id])
  end
end
