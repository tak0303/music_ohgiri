MusicOhgiri.controllers :youtube do
  get 'search/:query', :provides => [:json, :xml] do
    res = Youtube.find_video_by_query params[:query]
    return failure unless res
    return res
  end

end
