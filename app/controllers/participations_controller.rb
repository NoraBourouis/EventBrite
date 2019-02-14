class ParticipationsController < ApplicationController
  def index
    @attendance = Attendance.where(event_id: params[:event_id])
    @event = Event.find(params[:event_id])
  end

  def new
    @event = Event.find(params[:event_id])
    @attendance = Attendance.new
  end

  def create
    puts params
    @event = Event.find(params[:event_id])
    @attendance = Attendance.new
    @amount = @event.price

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Paiement',
      :currency    => 'eur'
    )
  
    @attendance = Attendance.new(
                       'stripe_customer_id' => customer.id ,
                       'event_id' => @event.id,
                       'user_id'=> current_user.id)
    if @attendance.save
        flash[:success] = "Vous êtes bien inscrit à l'événement."
        redirect_to event_path(@event.id) 
        puts "participation +1"
    else 
      puts 'soucis au niveau des participations/inscriptions'
    end
      
    rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_participation_path
    end
  end

