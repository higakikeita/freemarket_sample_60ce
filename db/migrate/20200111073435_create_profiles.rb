class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string     :first_name, null: false
      t.string     :last_name, null: false
      t.string     :first_name_kana, null: false
      t.string     :last_name_kana, null: false
      t.string     :phone_number, null: false, unique: true
      t.references :user, null: false, foreign_key: true
      t.date :birthday,null: false
      t.timestamps
    end
  end
end
