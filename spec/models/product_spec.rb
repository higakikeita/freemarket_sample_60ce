require 'rails_helper'
describe Product do  
  describe '#create' do
    it "全て入力されていればOK" do
      product = build(:product)
      expect(product).to be_valid
    end
    it "nameが空ならNG" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end
    it "explainが空ならNG" do
      product = build(:product, explain: nil)
      product.valid?
      expect(product.errors[:explain]).to include("can't be blank")
    end
    it "priceが空ならNG" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end
    it "priceがinteger以外ならNG" do
      product = build(:product, price: "３００")
      product.valid?
      expect(product.errors[:price]).to include("is not a number")
    end
    it "priceが300円未満ならNG" do
      product = build(:product, price: "290")
      product.valid?
      expect(product.errors[:price]).to include("must be greater than or equal to 300")
    end
    it "priceが9999999円よりも高額ならNG" do
      product = build(:product, price: "19999999")
      product.valid?
      expect(product.errors[:price]).to include("must be less than or equal to 9999999")
    end
  end
end


