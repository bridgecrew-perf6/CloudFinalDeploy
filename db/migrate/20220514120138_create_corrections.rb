class CreateCorrections < ActiveRecord::Migration[7.0]
  def change
    create_table :corrections do |t|
      t.belongs_to :writing, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
