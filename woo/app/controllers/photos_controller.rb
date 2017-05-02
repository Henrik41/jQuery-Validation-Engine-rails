class PhotosController < ApplicationController

  require 'flickraw'

  def index

  end

  def show
  FlickRaw.api_key='de0e2be23d8523a00e6b8e68765bac24'
  FlickRaw.shared_secret='33d52c3d446a2db4'
  url=params[:url]
  
    begin
  args = {}
  args[:sort] = 'relevance'
  args[:text] = "#{url.split('/').last}"
  
  info = flickr.photos.search args
  photo_array = (0..52).map { |x| FlickRaw.url(info[x])}
  @embed_photo = Kaminari.paginate_array(photo_array).page(params[:page]).per(12)

rescue
  @embed_photo = ['http://placekitten.com/180/200.jpg', 'http://placekitten.com/180/200.jpg' ]
end
  respond_to do |format|
    format.js { }
  end
  end


 def show2

 @picture = params[:picture]
 
 
 end

  
end
