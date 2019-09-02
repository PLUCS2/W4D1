class ArtworkSharesController < ApplicationController 

  def index
    artwork_shares = User.find(params[:user_id]).shared_artworks
    artist_work = User.find(params[:user_id]).artworks
    artist_work += artwork_shares
    # artist_work = ArtworkShare.artwork
    render json: artist_work
  end

  def show
    artwork_shares = ArtworkShare.find(params[:id])
    if artwork_shares
      render json: artwork_shares
    else 
      render json: artwork_shares.errors.full_messages, status: 422
    end 
  end

  def create
    artwork_shares = ArtworkShare.new(new_params)
    if artwork_shares.save!
      render json: artwork_shares
    else 
      render json: artwork_shares.errors.full_messages, status: :unprocessable_entity
    end 
  end

  def destroy
    artwork_shares = ArtworkShare.find(params[:id])
    if artwork_shares
      artwork_shares.destroy
      redirect_to artworks_shares_url 
    else 
      render json: artwork_shares.errors.full_messages, status: 422
    end 
  end 

  private 

  def new_params 
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end 

end