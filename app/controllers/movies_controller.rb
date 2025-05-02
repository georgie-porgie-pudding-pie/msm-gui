class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def new_item
    x = Movie.new
    x.title = params.fetch(:title)
    x.year = params.fetch(:year)
    x.duration = params.fetch(:dur)
    x.description = params.fetch(:desc)
    x.image = params.fetch(:image)
    x.director_id = params.fetch(:did)
    x.save
    redirect_to("/movies")
  end

  def update_item
    id = params.fetch(:id)
    x = Movie.where({ :id => id }).at(0)
    x.title = params.fetch(:title)
    x.year = params.fetch(:year)
    x.duration = params.fetch(:dur)
    x.description = params.fetch(:desc)
    x.image = params.fetch(:image)
    x.director_id = params.fetch(:did)
    x.save
    redirect_to("/movies/#{id}")
  end

  def delete_item
    id = params.fetch(:path_id)
    x = Movie.where({ :id => id }).at(0)
    x.destroy
    redirect_to("/movies")
  end



end
