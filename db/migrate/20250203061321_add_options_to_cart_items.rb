class AddOptionsToCartItems < ActiveRecord::Migration[8.0]
  def change
    add_column :cart_items, :options, :string
  end
end
