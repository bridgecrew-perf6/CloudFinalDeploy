class CreateReadings < ActiveRecord::Migration[7.0]
  def change
    create_table :readings do |t|
      t.string :title
      t.string :level
      t.text :body

      t.timestamps
    end
  end
end
