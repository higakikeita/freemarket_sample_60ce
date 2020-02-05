class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string    :postal_code, null: false, limit: 7
      t.integer    :prefecture, null: false
      t.string     :city, null: false
      t.string     :address, null: false
      t.string     :apartment
      t.references :user, null: false, foreign_key: true
      t.timestamps 
    end
  end
end
