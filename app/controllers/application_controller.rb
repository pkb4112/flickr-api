class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  require 'flickraw'


FlickRaw.api_key=ENV['FLICKR_API_KEY']
FlickRaw.shared_secret=ENV['FLICKR_API_SECRET']
end
