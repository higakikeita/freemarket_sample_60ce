class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, limit: 191,null:false,index: true
      t.integer :price, index: true
      t.text :explain,null:false
      t.integer :postage,null:false
      t.integer :status
      t.integer :shipping_date
      t.integer :size
      t.integer :brand_id
      t.integer :category_id
      t.integer :prefecture
      t.timestamps
    end
  end
end
