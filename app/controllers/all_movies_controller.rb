class AllMoviesController < ApplicationController

  def index
    @movies = Movie.all.page(params[:page]).per(1)
    @movie = @movies[rand(@movies.size)]
  end

  def show
    @movies = Movie.all.page(params[:page]).per(1)
    @movie = Movie.find(params[:id])
    @movie.increment_visualization
    render "index"
  end

end
