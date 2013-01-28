# -*- coding:utf-8 -*-
require 'json'
require 'youtube_it'

class Youtube < Sequel::Model
  def self.find_video_by_query query
    client = YouTubeIt::Client.new
    res = client.videos_by(:query => "#{query}", :page => 2, :per_page => 15, :alt => 'json')

    video_info = Array.new
    res.videos.each do |video|
      video_info << { title: "#{video.title}", video_url: "#{video.embed_url}", thumbnail: "#{video.thumbnails[1].url}" }
    end

    return failure if video_info.length == 0
    return JSON.generate(video_info)
  end
end