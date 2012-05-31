require 'sinatra'
require 'httparty'

get '/' do
  haml :index, :format => :html5
end

get '/api/' do
  p HTTParty.get('https://gdata.youtube.com/feeds/api/videos', :query => {:q => params[:q], :alt => 'json'}).inspect
end