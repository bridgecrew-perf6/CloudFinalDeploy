class RemoveTypeFromPrompts < ActiveRecord::Migration[7.0]
  def change
    remove_column :prompts, :type, :string
  end
end
