class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all.order({ :created_at => :desc })
    render({ :template => "photo_templates/index" })
  end

  def show
    photo_id = params.fetch("photo_id")
    @photo = Photo.where({:id => photo_id }).at(0)
    render({ :template => "photo_templates/show" })
  end

  def update
  end

  def delete
  end

  def insert_photo
    @new_photo = Photo.new
    @new_photo.image = params.fetch("image")
    @new_photo.caption = params.fetch("caption")
    @new_photo.owner_id = params.fetch("owner_id").to_i

    if @new_photo.valid?
      @new_photo.save
      redirect_to("/users/#{@new_photo.id}")
    else
      redirect_to("/photos")
    end
  end

  def insert_comment
  end
end
