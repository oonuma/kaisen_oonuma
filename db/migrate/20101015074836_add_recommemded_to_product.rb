class AddRecommemdedToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :recommended, :boolean
  end

  def self.down
    remove_column :products, :recommended
  end
end
