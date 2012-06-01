require 'sinatra'
require 'httparty'

class Youtube
  include HTTParty
  format :json
  
  def self.search(terms)
    get('https://gdata.youtube.com/feeds/api/videos?max-results=1', :query => {:q => terms, :alt => 'json'}).body
  end
end

set :haml, :format => :html5

post '/search' do
  redirect "/#{params[:q]}"
end

get '/:terms' do
  @data = Youtube.search(params[:terms])
  haml :index
end

get '/' do
  haml :index
end