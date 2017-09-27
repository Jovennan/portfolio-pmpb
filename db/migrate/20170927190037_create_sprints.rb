class CreateSprints < ActiveRecord::Migration[5.1]
  def change
    create_table :sprints do |t|
      t.date :initial_date
      t.date :final_Date
      t.references :schedule, foreign_key: true

      t.timestamps
    end
  end
end
