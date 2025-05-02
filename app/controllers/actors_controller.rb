class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def new_item
    x = Actor.new
    x.image = params.fetch(:image)
    x.name = params.fetch(:name)
    x.dob = params.fetch(:dob)
    x.bio = params.fetch(:bio)
    x.save
    redirect_to("/actors")
  end

  def update_item
    id = params.fetch(:id)
    x = Actor.where({ :id => id }).at(0)
    x.image = params.fetch(:image)
    x.name = params.fetch(:name)
    x.dob = params.fetch(:dob)
    x.bio = params.fetch(:bio)
    x.save
    redirect_to("/actors/#{id}")
  end

  def delete_item
    id = params.fetch(:path_id)
    x = Actor.where({ :id => id }).at(0)
    x.destroy
    redirect_to("/actors")
  end

end
