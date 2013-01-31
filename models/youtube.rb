require 'json'
require 'youtube_it'

class Youtube < ActiveRecord::Base
  def self.find_video_by_query(query,page=1)
    client = YouTubeIt::Client.new
    res = client.videos_by(:query => "#{query}", :page => "#{page}", :per_page => 15, :alt => 'json')

    video_info = Array.new
    res.videos.each do |video|
      video_info << {
                      title:     "#{video.title}",
                      video_url: "#{video.embed_url}",
                      thumbnail: "#{video.thumbnails[1].url}",
                      video_id:  "#{video.video_id}"
                     }
    end

    return failure if video_info.length == 0
    return JSON.generate(video_info)
  end
end