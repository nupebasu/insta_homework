class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end

  def show
    @favorite = Favorite.find(params[:id])
  end

  def new
    @favorite = Favorite.new
    # @favorite.photo_id = params[:photo_id]
    # @favorite.user_id = params[:user_id]
  end

  def create
    @favorite = Favorite.new
    @favorite.photo_id = params[:photo_id]
    @favorite.user_id = current_user.id

    if @favorite.save
      redirect_to "/photos/#{@favorite.photo_id}", :notice => "Favorite created successfully."
    else
      render 'new'
    end
  end

  def edit
    @favorite = Favorite.find(params[:id])
  end

  def update
    @favorite = Favorite.find(params[:id])

    @favorite.photo_id = params[:photo_id]
    @favorite.user_id = current_user.id

    if @favorite.save
      redirect_to "/photos/#{@favorite.photo_id}", :notice => "Favorite updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])

    @favorite.destroy

    redirect_to "/favorites", :notice => "Favorite deleted."
  end
end
