class RemoveImageUrlFromProducts < ActiveRecord::Migration[5.0]
  def self.up
    remove_column :products, :image_url
  end

  def self.down
    add_column :products, :image_url, :string
  end
end
