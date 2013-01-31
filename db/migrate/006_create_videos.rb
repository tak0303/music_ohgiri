class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.integer :video_id
      t.integer :topic_id
      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
