require 'json'
MusicOhgiri.controllers :playlist do
  get ':topic_id/add/:video_id', :provides => [:json, :xml] do
    Playlist.add_video_info_by_topic params, current_account
    return JSON.generate([true])
  end

  get ':topic_id/remove/:video_id', :provides => [:json, :xml] do
    Playlist.remove_video_info_by_topic params, current_account
    return JSON.generate([true])
  end
end