class AddColumsToVideo < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.string :title
    t.string :thumbnail_url
    end
  end

  def self.down
    change_table :videos do |t|
      t.remove :title
    t.remove :thumbnail_url
    end
  end
end
