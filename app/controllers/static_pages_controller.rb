class StaticPagesController < ApplicationController
  require 'flickr'
  def index
    flickr = Flickr.new
    @user_id =
      if params[:username].present?
        flickr.people.findByUsername(username: params[:username]).id
      else
        params[:user_id]
      end
    @photos =
      if @user_id.present?
        flickr.photos.search(user_id: @user_id)
      else
        flickr.photos.getRecent.first(15)
      end
  end
end
