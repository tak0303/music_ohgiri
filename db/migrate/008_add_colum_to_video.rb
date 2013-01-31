class AddColumToVideo < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.integer :playlist_id
    end
  end

  def self.down
    change_table :videos do |t|
      t.remove :playlist_id
    end
  end
end
