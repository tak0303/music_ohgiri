class CreatePlaylists < ActiveRecord::Migration
  def self.up
    create_table :playlists do |t|
      t.integer :vodeo_id
      t.integer :topic_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :playlists
  end
end
