class CreatePrompts < ActiveRecord::Migration[7.0]
  def change
    create_table :prompts do |t|
      t.string :topic
      t.string :level
      t.string :type

      t.timestamps
    end
  end
end
