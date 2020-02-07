class Creditcard < ApplicationRecord
  belongs_to :user, optional: true
  validates :card_number, :card_company, :card_year, :card_month,:card_pass, presence: true
  validates :card_number,:card_pass, numericality: { only_integer: true }
  validates :card_number, length: { is: 16 }
  validates :card_pass, length: { in: 3..4 }

  enum card_company:{
    VISA:1,Mastercard:2,セゾンカード:3,JCB:4,アメリカンエキスプレス:5,ダイナーズ:6,ディスカバー:7
  }
end
