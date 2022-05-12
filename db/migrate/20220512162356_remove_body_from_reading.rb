class RemoveBodyFromReading < ActiveRecord::Migration[7.0]
  def change
    remove_column :readings, :body, :text
  end
end
