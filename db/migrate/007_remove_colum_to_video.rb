class RemoveColumToVideo < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.remove :topic_id
    end
  end

  def self.down
    change_table :videos do |t|
      t.integer :topic_id
    end
  end
end
