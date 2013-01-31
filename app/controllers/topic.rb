#coding: utf-8
MusicOhgiri.controllers :topic do
  get :today do
    topic = TodaysTopic.new.get
    return failure unless topic
    return topic
  end
end