class CreateCreditcards < ActiveRecord::Migration[5.0]
  def change
    create_table :creditcards do |t|
      t.string     :card_company, null: false
      t.string     :card_number, null: false
      t.integer    :card_year, null: false
      t.integer    :card_month, null: false
      t.integer    :card_pass, null: false
      t.references :user, null: false, foreign_key: true
      t.string :customer_id, null: false
      t.string :card_id, null: false
      t.timestamps
    end
  end
end
