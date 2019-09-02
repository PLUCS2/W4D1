class UsersController < ApplicationController 
  def index
    if params[:username]
      user = User.find_by(username: params[:username])
      if user
        render json: user 
      else 
        render json: user.errors.full_messages, status: 422
      end 
    else 
      users = User.all  
      render json: users
    end 
  end

  def create
    user = User.new(new_params)
    if user.save!
      render json: user
    else 
      render json: user.errors.full_messages, status: :unprocessable_entity
    end 
  end

  def show
    user = User.find(params[:id])
    if user
      render json: user
    else 
      render json: user.errors.full_messages, status: 422
    end 
  end

  def update
    user = User.find(params[:id])
    if user 
      user.update(new_params)
      render json: user
    else 
      render json: user.errors.full_messages, status: 422
    end 
  end 

  def destroy
    user = User.find(params[:id])
    if user
      user.destroy
      redirect_to users_url 
    else 
      render json: user.errors.full_messages, status: 422
    end 
  end 


  private

  def new_params
    params.require(:user).permit(:name, :email)
  end
end