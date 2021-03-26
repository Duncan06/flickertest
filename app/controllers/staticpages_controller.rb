class StaticpagesController < ApplicationController
  require 'flickr'

  def index
    flickr = Flickr.new ENV['FLICKR_KEY'], ENV['FLICKR_SECRET']
      if params[:id]
        begin
          @pictures = flickr.people.getPhotos(user_id: params[:id])
        rescue Flickr::FailedResponse
          flash.now[:alert] = "User unable to be found."
        end
      else
        render :index
      end
  end

end
