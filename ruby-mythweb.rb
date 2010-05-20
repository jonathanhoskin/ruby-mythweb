require 'rubygems'
require 'sinatra'
require 'haml'
require 'ruby-mythtv'

host = "pvr"

mythbackend = MythTV.connect_backend(:host => host)

get '/' do
  haml :index
end
 
get '/recordings/' do
  @recordings = mythbackend.query_recordings
  #puts @recordings.inspect
  haml :recordings
end

get '/recordings/*/*' do
  @recording = mythbackend.query_recordings(options = { :filter => { :pathname => /#{params[:splat][0]}_#{params[:splat][1]}/ }})[0]
  
  "#{@recording.title}\n<br>\n#{@recording.description}"
  
  #mythbackend.query_recordings(options = { :filter => { :pathname => /2003_20090704193001/ }} )[0].recstartts
end