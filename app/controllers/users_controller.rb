class UsersController < ApplicationController
  #before_action :custom, only: [:show]
  before_action :authenticate_user!,  only: [:show]

  def index
    @user = User.all
  end
  
  def show
    @user= User.find(params[:id])
    @event = Event.where(admin_id: @user)
  end

  def edit
    @user = User.find(params[:id])
  end


  def update 
    @user = User.find(params[:id])
  
    if @user.update("first_name" => params[:first_name], "last_name" =>  params[:last_name], "description" =>  params[:description],  "email" =>  params[:email])
        redirect_to @user, success: " Event successfully modified!"
      else
        render :edit
      end
  end


private 

  def custom
    unless current_user.id == (params[:id]).to_i
      redirect_to root_path
      flash[:notice] = "Accès interdit, ce n'est pas ton profil."
    end 

  end
end

