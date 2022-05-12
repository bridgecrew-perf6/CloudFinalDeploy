class AddDetailsToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :level, :string
    add_column :questions, :keyword, :string
    add_column :questions, :prompt, :string
  end
end
