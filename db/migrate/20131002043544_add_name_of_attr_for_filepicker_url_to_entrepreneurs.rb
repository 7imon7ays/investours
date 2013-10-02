class AddNameOfAttrForFilepickerUrlToEntrepreneurs < ActiveRecord::Migration
  def change
    add_column :entrepreneurs, :filepicker_url, :string
  end
end
