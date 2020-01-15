class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.text :product_image,null: false
      t.references :product,null: false, foreign_key: true
      t.timestamps
    end
  end
end
