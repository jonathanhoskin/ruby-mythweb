def get_recording_object(mythbackend)
  channel = params[:splat][0]
  startts = params[:splat][1]
  queryre = /#{channel}_#{startts}/
  @recording = mythbackend.query_recordings(options = { :filter => { :pathname => queryre }}).first
end

# def get_recording_page(recording)
#   "#{@recording.title}\n<br>\n#{@recording.description}"

def get_img_path
  channel = params[:splat][0]
  startts = params[:splat][1]
  img_path = "/images/thumbnails/#{channel}/#{startts}.png"
end