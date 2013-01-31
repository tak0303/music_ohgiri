class CreateTodaysTopics < ActiveRecord::Migration
  def self.up
    create_table :todays_topics do |t|
      t.string :topic
      t.timestamps
    end
  end

  def self.down
    drop_table :todays_topics
  end
end
