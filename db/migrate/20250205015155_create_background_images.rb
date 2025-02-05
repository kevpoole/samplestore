class CreateBackgroundImages < ActiveRecord::Migration[8.0]
  def change
    create_table :background_images do |t|

      t.timestamps
    end
  end
end
