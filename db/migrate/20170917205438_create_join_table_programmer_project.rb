class CreateJoinTableProgrammerProject < ActiveRecord::Migration[5.1]
  def change
    create_join_table :programmers, :projects do |t|
      t.index [:programmer_id, :project_id]
      # t.index [:project_id, :programmer_id]
    end
  end
end
