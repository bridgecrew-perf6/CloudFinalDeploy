class CreateListenings < ActiveRecord::Migration[7.0]
  def change
    create_table :listenings do |t|
      t.string :title
      t.string :level

      t.timestamps
    end
  end
end
