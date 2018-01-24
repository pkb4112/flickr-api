class StaticPagesController < ApplicationController

	def index
		
		if @flickr_id = flickr_params[:flickr_id]
	     begin 
		   @photos = flickr_photos(@flickr_id)
		 rescue 
		 	flash[:danger] = "User Not Found"
		 	render 'index'
		 end
	    end
	end

	private

	def flickr_photos(flickr_id)
		  @photos = flickr.people.getPublicPhotos(:user_id => flickr_id, :per_page => 10)
		  @photo_urls = []
		  @photos.each do |photo|
		  photo_info = flickr.photos.getInfo(photo_id: photo.id)
		  @photo_urls << FlickRaw.url(photo_info)
		end
		return @photo_urls
	end

	def flickr_params
		params.permit(:flickr_id)
	end
end
