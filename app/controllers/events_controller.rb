class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @event= Event.all
  end

  def new
    @event = Event.new
  end

  def create 
    puts params
    @event = Event.new('start_date' => params[:start_date],
                       'duration' => params[:duration],
                       'title' => params[:title],
                       'description'=> params[:description],
                       'price' => params[:price],
                       'location' => params[:location],
                       'admin_id'=> current_user.id)
      if @event.save
        flash[:success] = "Woohoo, cet évent sera trop l'éclate!"
        redirect_to event_path(@event.id) 
        puts "event created"
      else
        flash[:notice] = "Formulaire incomplet. "
        render 'new'
      end
  end

  def show
    @event= Event.find(params[:id])
    @admin = @event.admin_id
    
    @attendance = Attendance.where(event_id: @user)
  end

  private

  def end_date
  end_date = start_date + duration.to_i 
  return @end_date
end
end
