class CreateShows < ActiveRecord::Migration[5.0]
  def change
    create_table :shows do |t|
      t.string :title, null: false
      t.string   "title", null: false
      t.string   "image_url", default: "http://i.imgur.com/WD4Ptgi.jpg"
      t.string   "description", default: ""

      t.belongs_to :user
      t.timestamps
    end
  end
end
