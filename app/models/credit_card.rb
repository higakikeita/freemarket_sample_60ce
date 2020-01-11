class CreditCard < ApplicationRecord
  belongs_to :user, optional: true
  validates :card_company, :card_number, :card_year, :card_month, :card_pass, presence: true
end
