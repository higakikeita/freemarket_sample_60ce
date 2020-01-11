class Profile < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, presence: true
end
