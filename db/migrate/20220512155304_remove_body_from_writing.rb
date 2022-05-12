class RemoveBodyFromWriting < ActiveRecord::Migration[7.0]
  def change
    remove_column :writings, :body, :text
  end
end
