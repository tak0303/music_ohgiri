# -*- coding:utf-8 -*-

require 'net/http'
require 'libxml'
class Youtube < Sequel::Model
  def self.find_video_by_query query
    return false if query.to_s.length == 0
    parsed_uri = URI.parse("http://gdata.youtube.com/feeds/api/videos/-/#{query.to_s}?alt=json")
    http = Net::HTTP.new(parsed_uri.host, parsed_uri.port)
    request = Net::HTTP::Get.new parsed_uri.request_uri
    response = http.request request
    return false if response.code.to_i != 200
    response.body
  end
end