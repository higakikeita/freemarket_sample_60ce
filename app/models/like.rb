class Like < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates_uniqueness_of :post_id, scope: :user_id
end
