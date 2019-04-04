class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = current_user.movies.all.page(params[:page]).per(5)
  end

  def new
    @movie = Movie.new
  end

  def create
   @movie = Movie.new(movie_params)

   respond_to do |format|
     if @movie.save
       format.html { redirect_to movies_path, notice: 'movie was successfully created.' }
       format.json { render :show, status: :created, location: @movie }
     else
       format.html { render :new }
       format.json { render json: @movie.errors, status: :unprocessable_entity }
     end
   end
 end

 def destroy
   @movie.destroy
      respond_to do |format|
      format.html { redirect_to movies_path, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
 end

 def edit
 end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movies_path, notice: 'movie was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

 private

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      {user:current_user}.merge(params.require(:movie).permit(:description,:file))
    end

end
