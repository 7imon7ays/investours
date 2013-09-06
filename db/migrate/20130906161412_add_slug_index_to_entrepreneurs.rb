class AddSlugIndexToEntrepreneurs < ActiveRecord::Migration
  def change
    add_index :entrepreneurs, :slug, unique: true
  end
end
