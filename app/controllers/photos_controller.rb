class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
    
    # Simple GET to all photo entries
    if !params.key?("input_photo_url") 
      render({ :template => "photos_templates/index.html.erb" })
    
    # Add a new photo
    else
      # Gather query string parameter input form data
      new_photo_url = params.fetch("input_photo_url")
      new_photo_caption = params.fetch("input_caption")
      new_photo_user = params.fetch("input_owner_id").to_i
     
      # Create new photo
      new_photo = Photo.new
      new_photo.image = new_photo_url
      new_photo.caption = new_photo_caption
      new_photo.owner_id = new_photo_user 
      new_photo.save

      redirect_to("/photos/#{new_photo.id}")
    end
  end

  def get_user_photos
    @photo_id = params.fetch("photo_id")
    @photo = Photo.where({ :id => @photo_id.to_i }).at(0)

    # Simple GET to specific photo
    if !params.key?("input_image_url") 
      render({ :template => "photos_templates/photo.html.erb" })

    # Update the image if we find query string parameters
    else
      new_image_url = params.fetch("input_image_url")
      new_image_caption = params.fetch("input_image_caption")
      
      @photo.image = new_image_url
      @photo.caption = new_image_caption
      
      @photo.save
      redirect_to("/photos/#{@photo_id}")
    end
  end

  def delete_photo
    @photo_id = params.fetch("photo_id")
    @photo = Photo.where({ :id => @photo_id.to_i }).at(0)

    # First delete the comments associated with the photo!
    @photo.comments.each do | comment |
      comment.destroy
    end
    
    @photo.destroy

    redirect_to("/photos")
  end


end
