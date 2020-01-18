class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, limit: 191, index: true
      t.integer :price, index: true
      t.text :explain
      t.integer :postage
      t.string :region
      t.string :status
      t.date :shipping_date
      t.integer :size
      t.integer :brand_id
      t.integer :category_id
      t.string :product
      t.string :image
      t.string :prefecture
      t.timestamps
    end
  end
end
