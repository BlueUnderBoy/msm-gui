class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def create 
    m = Movie.new
    m.title = params.fetch("title_field")
    m.year = params.fetch("year_field")
    m.duration = params.fetch("duration_field")
    m.description = params.fetch("description_field")
    m.image = params.fetch("image_field")
    m.director_id = params.fetch("director_field")

    m.save
    redirect_to("/movies")
  end 

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end
end
