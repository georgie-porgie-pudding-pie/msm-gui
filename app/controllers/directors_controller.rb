class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end

  def new_item
    x = Director.new
    x.image = params.fetch(:image)
    x.name = params.fetch(:name)
    x.dob = params.fetch(:dob)
    x.bio = params.fetch(:bio)
    x.save
    redirect_to("/directors")
  end

  def update_item
    id = params.fetch(:id)
    x = Director.where({ :id => id }).at(0)
    x.image = params.fetch(:image)
    x.name = params.fetch(:name)
    x.dob = params.fetch(:dob)
    x.bio = params.fetch(:bio)
    x.save
    redirect_to("/directors/#{id}")
  end

  def delete_item
    id = params.fetch(:path_id)
    x = Director.where({ :id => id }).at(0)
    x.destroy
    redirect_to("/directors")
  end


end
