class AddProviderToAccount < ActiveRecord::Migration
  def self.up
    change_table :accounts do |t|
      t.string :provider
    end
  end

  def self.down
    change_table :accounts do |t|
      t.remove :provider
    end
  end
end
