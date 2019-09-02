class ArtworksController < ApplicationController 
  
  def index
    artworks = Artwork.all  
    render json: artworks

    # render plain: "I'm in the index action!"
  end

  def create
    artwork = Artwork.new(new_params)
    if artwork.save!
      render json: artwork
    else 
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end 
  end

  def show
    artwork = Artwork.find(params[:id])
    if artwork
      render json: artwork
    else 
      render json: artwork.errors.full_messages, status: 422
    end 
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork 
      artwork.update(new_params)
      render json: artwork
    else 
      render json: artwork.errors.full_messages, status: 422
    end 
  end 

  def destroy
    artwork = Artwork.find(params[:id])
    if artwork
      artwork.destroy
      redirect_to artworks_url 
    else 
      render json: artwork.errors.full_messages, status: 422
    end 
  end 


  private

  def new_params
    params.require(:artwork).permit(:artist_id, :title, :image_url)
  end
end