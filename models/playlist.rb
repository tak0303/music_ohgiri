class Playlist < ActiveRecord::Base
  has_many :videos
  belongs_to :account

  class << self
    def add_video_info_by_topic info, current_account
      begin
        p_list = Playlist.find_by_user_id_and_topic_id current_account.id, info[:topic_id]
        unless p_list.present?
          Playlist.new({
            topic_id: info[:topic_id],
            user_id: current_account.id
          }).save
          p_list = Playlist.find_by_user_id_and_topic_id current_account.id, info[:topic_id]
        end
        video_info = YouTubeIt::Client.new.video_by info[:video_id]
        Video.find_or_create_by_video_id_and_playlist_id({
          video_id: info[:video_id],
          playlist_id: p_list.id,
          title: video_info.title,
          thumbnail_url: video_info.thumbnails[1].url,
          embed_url: video_info.embed_url
        }).save
      rescue => e
        raise e
      end
    end

    def remove_video_info_by_topic info, current_account
      p_list = Playlist.find_by_user_id_and_topic_id current_account.id, info[:topic_id]
      raise 'cant find playlist' unless p_list.present?
      Video.find_or_create_by_video_id_and_playlist_id({
        video_id: info[:video_id],
        playlist_id: p_list.id
      }).delete
    end
  end
end
