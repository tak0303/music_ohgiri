#coding: utf-8
topics_data = %w(
  春を感じさせる曲
  しんみりする曲
  自分が選ぶ、クラシック10選
  秋を感じさせる曲
  j-popならこれ聞いとけ
  洋楽ならこれ聞いとけ
  冬に聞きたい曲
  k-popおすすめの10曲
  世界にこの10曲しかないとしたら...??
  夏に聞きたい曲
  テンション上げるならこれ聞いとけ
  自分の選ぶClassic Best
  春を感じさせる曲
  しんみりする曲
  自分が選ぶ、クラシック10選
  秋を感じさせる曲
  j-popならこれ聞いとけ
  洋楽ならこれ聞いとけ
  冬に聞きたい曲
  k-popおすすめの10曲
  世界にこの10曲しかないとしたら...??
  夏に聞きたい曲
  テンション上げるならこれ聞いとけ
  自分の選ぶClassic Best
  春を感じさせる曲
  しんみりする曲
  自分が選ぶ、クラシック10選
  秋を感じさせる曲
  j-popならこれ聞いとけ
  洋楽ならこれ聞いとけ
  冬に聞きたい曲
  k-popおすすめの10曲
  世界にこの10曲しかないとしたら...??
  夏に聞きたい曲
  テンション上げるならこれ聞いとけ
  自分の選ぶClassic Best
)
topics_data.each do |text|
  TodaysTopic.create(:topic => text)
end

shell.say "#{TodaysTopic.all.count} topics has inserted in Topics table"