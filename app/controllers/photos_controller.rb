class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
  end

  def edit
  end

  def update

    @photo = Photo.update(photo_params)
  end

  def destroy
    @photo.destroy
  end

  def photo_params
    params.require(:photo).permit(:name, :location, :caption)
  end
end
