require 'json'
MusicOhgiri.controllers :playlist do
  get ':topic_id/add/:video_id', :provides => [:json, :xml] do
    p_list = Playlist.find_by_user_id_and_topic_id current_account.id, params[:topic_id]
    unless p_list.present?
      p_list = Playlist.new({
        topic_id: params[:topic_id],
        user_id: current_account.id
      }).save!
    end
    Video.find_or_create_by_video_id_and_playlist_id({
      video_id: params[:video_id],
      playlist_id: p_list.id
    }).save
    return JSON.generate([true])
  end
end
