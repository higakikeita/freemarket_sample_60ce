require 'rails_helper'

describe Product do
  describe '#create' do
    it "全て入力されていればOK" do
      product = create(:product)
      expect(product).to be_valid
    end
    it "nameが空ならNG" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end
    it "explainが空ならNG" do
      product = build(:product, explain: nil)
      product.valid?
      expect(product.errors[:explain]).to include("を入力してください")
    end
    it "priceが空ならNG" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end
    it "priceがinteger以外ならNG" do
      product = build(:product, price: "３００")
      product.valid?
      expect(product.errors[:price]).to include("は数値で入力してください")
    end
    it "priceが300円未満ならNG" do
      product = build(:product, price: "290")
      product.valid?
      expect(product.errors[:price]).to include("は300以上の値にしてください")
    end
    it "priceが9999999円よりも高額ならNG" do
      product = build(:product, price: "19999999")
      product.valid?
      expect(product.errors[:price]).to include("は9999999以下の値にしてください")
    end
  end
end