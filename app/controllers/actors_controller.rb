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

  def create 
    a = Actor.new
    a.name = params.fetch("name_field")
    a.dob = params.fetch("dob_field")
    a.bio = params.fetch("bio_field")
    a.image = params.fetch("image_field")

    a.save
    redirect_to("/actors")
  end

  def update
    the_id = params.fetch("path_id")
    the_actor = Actor.where({:id => the_id}).at(0)
    the_actor.name = params.fetch("name_field")
    the_actor.dob = params.fetch("dob_field")
    the_actor.bio = params.fetch("bio_field")
    the_actor.image = params.fetch("image_field")

    the_actor.save
    redirect_to("/actors/#{the_actor.id}")
  end

  def destroy
    the_id = params.fetch("path_id")
    matching_record = Actor.where({:id => the_id})
    the_actor = matching_record.at(0)
    the_actor.destroy
    redirect_to("/actors")
  end

end
