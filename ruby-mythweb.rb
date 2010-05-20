require 'rubygems'
require 'sinatra'
require 'haml'
require 'ruby-mythtv'
require 'lib/recording'

host = "pvr"

mythbackend = MythTV.connect_backend(:host => host)

mime_type :png, 'image/png'

get '/' do
  haml :index
end
 
get '/recordings/' do
  @recordings = mythbackend.query_recordings
  #puts @recordings.inspect
  haml :recordings
end

get '/images/thumbnails/*/*.png' do
  content_type :png
  @recording = get_recording_object(mythbackend)
  preview_image = mythbackend.preview_image(@recording)
  preview_image
end

get '/recordings/*/*' do
  @recording = get_recording_object(mythbackend)
  @img_path = get_img_path
  haml :recording
  #mythbackend.query_recordings(options = { :filter => { :pathname => /2003_20090704193001/ }} )[0].recstartts
end
