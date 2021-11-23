class StaticPagesController < ApplicationController
  require 'flickr'
  def index
    @flickr = Flickr.new
    fetch_uid
    fetch_photos
  end

  private

  def fetch_uid
    @user_id =
      if params[:username].present?
        @flickr.people.findByUsername(username: params[:username]).id
      else
        params[:user_id]
      end
  end

  def fetch_photos
    @photos =
      if @user_id.present?
        @flickr.photos.search(user_id: @user_id)
      else
        @flickr.photos.getRecent.first(15)
      end
  end
end
