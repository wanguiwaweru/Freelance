class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.integer :status
      t.belongs_to :client, foreign_key: true
      t.timestamps
    end
  end
end
