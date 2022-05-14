class AddIntroToPrompts < ActiveRecord::Migration[7.0]
  def change
    add_column :prompts, :intro, :string
  end
end
