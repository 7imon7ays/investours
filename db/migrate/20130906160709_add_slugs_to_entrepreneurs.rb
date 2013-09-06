class AddSlugsToEntrepreneurs < ActiveRecord::Migration
  def change
    add_column :entrepreneurs, :slug, :string
  end
end
