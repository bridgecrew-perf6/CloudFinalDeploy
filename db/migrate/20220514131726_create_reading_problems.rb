class CreateReadingProblems < ActiveRecord::Migration[7.0]
  def change
    create_table :reading_problems do |t|
      t.integer :index
      t.string :question
      t.string :answer
      t.belongs_to :reading, null: false, foreign_key: true

      t.timestamps
    end
  end
end
