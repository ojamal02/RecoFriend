class Lists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :title, null: false
      t.string :body, null: false

      t.belongs_to :user
      t.timestamps
    end
  end
end
