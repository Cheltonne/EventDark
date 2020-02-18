class EventsController < ApplicationController
  def index
  end

  def create
      puts "La méthode create s'est lancée correctement."
      puts '$' * 60
      puts params
      puts '$' * 60
      @event = Event.new(title: params[:title], description: params[:body], admin_id: 4, start_date: params[:start_date], duration: params[:duration], price:  params[:price], location: params[:location])
      if @event.save
        flash[:notice] = "Votre gossip a bien été sauvegardé."
        redirect_to root_path
      else
        @errors = @event.errors
        render new_event_path
      end
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def show
    puts "On affiche un seul évènement"
    @event = Event.find(params[:id])
    @admin = Event.find(params[:id]).admin.first_name + "#{Event.find(params[:id]).admin.last_name}"
    @title = Event.find(params[:id]).title
    @creation_date = Event.find(params[:id]).created_at
  end

  def update
  end

  def destroy
  end
end