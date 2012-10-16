class UsersController < ApplicationController

  # Insert database records in created order
  def index
    @users = User.order('created_at DESC').all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end

  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end


  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
     end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def destroy

    @user = user.find(params[:id])
    if @user.destroy
      flash[:notice] = "User Deleted Successfully"
    else
      flash[:error] = "User NOT Deleted"
    end
    redirect_to users_path
  end


end
