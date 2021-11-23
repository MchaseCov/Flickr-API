class StaticPagesController < ApplicationController
  require 'flickr'
  def index
    flickr = Flickr.new
    @photos =
      if params[:user_id].present?
        flickr.photos.search(user_id: params[:user_id])
      else
        flickr.photos.getRecent.first(15)
      end
  end
end
