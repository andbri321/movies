class AllMoviesController < ApplicationController
  def index
    @movies = Movie.all.page(params[:page]).per(1)
  end
end
