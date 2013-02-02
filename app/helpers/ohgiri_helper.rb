MusicOhgiri.helpers do
  # Failure response
  #
  # @params String message error message.
  # @params Object ingredient append variables.
  # @return String error response
  def failure message=nil, ingredient=nil
    response = ({
      :status => "NG",
      :message => message.nil? ? "Error!" : message
    })
    response.merge! ingredient if !ingredient.nil? and ingredient.is_a?(Hash)
    return build_response(response)
  end

  def get_playlist_by_topic
    list = Playlist.find_by_user_id_and_topic_id(current_account.id,TodaysTopic.new.get.id)
    return false if list.blank?
    list
  end

  def get_all_playlist_by_topic
    lists = Array.new
    Account.find(:all).each do |user|
    list = Playlist.find_by_user_id_and_topic_id(current_account.id,TodaysTopic.new.get.id)
    lists << list unless list.blank?
    end
    lists
  end

  def video_info video_id
    @client ||= YouTubeIt::Client.new
    @client.video_by video_id
  end
end