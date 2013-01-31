# -*- coding:utf-8 -*-
require 'active_support/core_ext'
class TodaysTopic < ActiveRecord::Base
  def get
    if last_day_of_the_month? then TodaysTopic.find(:last) end
    if is_today?
      TodaysTopic.find(Date.today.day)
    else
      TodaysTopic.find(Date.today.day - 1)
    end
  end

  private
  #=== 日付が変更されたかどうかを確認する関数(9amから次の日の8:59amまでを1日とする)
  #
  #=== usage
  # is_next_day?
  # => if date has changed, return true, if not( is yesterday ), return false
  def is_today?
    9.hours.ago.today?
  end

  #=== check if today is a last day of the month
  #
  #=== usage
  # last_day_of_the_month?
  #   => return true if today is last day of the month. if not, return false
  def last_day_of_the_month?
    Date.today.day == Date.today.end_of_month.day
  end
end