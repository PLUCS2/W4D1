class CommentsController < ApplicationController 

  def index
    if params.keys.include?("user_id")
      comments = User.find(params[:user_id]).comments
    elsif params.keys.include?("artwork_id")
      comments = Artwork.find(params[:artwork_id]).comments
    else
      render json: comments.errors.full_messages, status: 422
    end

    render json: comments
  end

  def create
    comments = Comment.new(new_params)
    if comments.save!
      render json: comments
    else 
      render json: comments.errors.full_messages, status: :unprocessable_entity
    end 
  end 

  def destroy
    comments = Comment.find(params[:id])
    if comments
      comments.destroy
      render plain: 'comment was deleted'
    else 
      render json: comments.errors.full_messages, status: 422
    end 
  end 

  private 
  
  def new_params
    params.require(:comment).permit(:artwork_id, :user_id, :body)
  end   
end 