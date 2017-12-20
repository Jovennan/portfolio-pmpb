class AddApilidoToClient < ActiveRecord::Migration[5.1]
  def change
     add_column :clients, :apelido, :string    
  end
end
