class CreateListeningOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :listening_options do |t|
      t.integer :index
      t.string :question
      t.string :a
      t.string :b
      t.string :c
      t.string :answer
      t.belongs_to :listening, null: false, foreign_key: true

      t.timestamps
    end
  end
end
