class RemoveColumToPlaylist < ActiveRecord::Migration
  def self.up
    change_table :playlists do |t|
      t.remove :vodeo_id
    end
  end

  def self.down
    change_table :playlists do |t|
      t.integer :vodeo_id
    end
  end
end
