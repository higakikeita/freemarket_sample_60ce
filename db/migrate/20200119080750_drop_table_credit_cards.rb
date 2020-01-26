class DropTableCreditCards < ActiveRecord::Migration[5.0]
  def change
    drop_table :credit_cards
    drop_table :profiles
  end
end
