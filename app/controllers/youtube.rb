MusicOhgiri.controllers :youtube do
  get 'search/:query/:page', :provides => [:json, :xml] do
    res = Youtube.find_video_by_query params[:query], params[:page]
    return failure unless res
    return res
  end
end