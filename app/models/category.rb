class Category < ApplicationRecord
  has_many :products
  has_ancestry
end