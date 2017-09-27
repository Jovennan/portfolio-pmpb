class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.date :initial_date
      t.date :final_date
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
