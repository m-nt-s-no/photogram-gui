class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all.order({ :created_at => :desc })
    render({ :template => "photo_templates/index" })
  end

  def show
    photo_id = params.fetch("photo_id")
    @photo = Photo.find(photo_id)
    render({ :template => "photo_templates/show" })
  end

  def update
    the_id = params.fetch("id")
    new_image = params.fetch("new_image")
    new_caption = params.fetch("new_caption")

    the_photo = Photo.find(the_id)
    the_photo.image = new_image
    the_photo.caption = new_caption
    the_photo.updated_at = Time.current

    the_photo.save
    redirect_to("/photos/#{the_photo.id}")
  end

  def delete
    the_id = params.fetch("id")
    the_photo = Photo.find(the_id)
    the_photo.destroy

    redirect_to("/photos")
  end

  def insert_photo
    @new_photo = Photo.new
    @new_photo.image = params.fetch("image")
    @new_photo.caption = params.fetch("caption")
    @new_photo.owner_id = params.fetch("owner_id").to_i

    if @new_photo.valid?
      @new_photo.save
      redirect_to("/photos/#{@new_photo.id}")
    else
      redirect_to("/photos")
    end
  end

  def insert_comment
    @new_comment = Comment.new
    @new_comment.photo_id = params.fetch("photo_id").to_i
    @new_comment.author_id = params.fetch("author_id").to_i
    @new_comment.body = params.fetch("comment")

    if @new_comment.valid?
      @new_comment.save
      the_photo = Photo.find(@new_comment.photo_id)
      the_photo.comments_count = the_photo.comments_count + 1
      the_photo.save
    end
    
    redirect_to("/photos/#{params.fetch("photo_id").to_i}")
  end
end
