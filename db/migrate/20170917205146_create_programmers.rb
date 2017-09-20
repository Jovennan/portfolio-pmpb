class CreateProgrammers < ActiveRecord::Migration[5.1]
  def change
    create_table :programmers do |t|
      t.string :name

      t.timestamps
    end
  end
end
