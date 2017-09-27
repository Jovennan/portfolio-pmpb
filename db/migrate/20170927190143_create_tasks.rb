class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :status
      t.references :sprint, foreign_key: true
      t.references :programmer, foreign_key: true

      t.timestamps
    end
  end
end
