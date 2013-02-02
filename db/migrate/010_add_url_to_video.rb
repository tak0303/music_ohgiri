class AddUrlToVideo < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.string :embed_url
    end
  end

  def self.down
    change_table :videos do |t|
      t.remove :embed_url
    end
  end
end
