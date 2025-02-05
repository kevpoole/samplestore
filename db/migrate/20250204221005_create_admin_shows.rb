class CreateAdminShows < ActiveRecord::Migration[8.0]
  def change
    create_table :shows do |t|
      t.string :venue
      t.datetime :date
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
