class Suggestions < ActiveRecord::Migration[5.0]
  def change
    create_table :suggestions do |t|
      t.string :show_name, null: false
      t.string :description, null: false

      t.belongs_to :list
      t.belongs_to :user
      t.timestamps
    end 
  end
end
