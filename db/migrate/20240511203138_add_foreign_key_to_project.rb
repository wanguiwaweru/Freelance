class AddForeignKeyToProject < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :client_id, :integer
  end
end
