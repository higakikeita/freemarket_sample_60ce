require 'rails_helper'
describe Creditcard do
  describe '#create' do
    it "全て入力されていればOK" do
      product = build(:creditcard)
      expect(product).to be_valid
    end
    it "card_numberが空ならNG" do
      product = build(:creditcard, card_number: nil)
      product.valid?
      expect(product.errors[:card_number]).to include("can't be blank")
    end
    it "card_numberがinteger以外ならNG" do
      product = build(:creditcard, card_number: "１１１１１１１１１１１１１１１１")
      product.valid?
      expect(product.errors[:card_number]).to include("is not a number")
    end
    it "card_numberが16文字以外ならNG" do
      product = build(:creditcard, card_number: "111111111111111")
      product.valid?
      expect(product.errors[:card_number]).to include("is the wrong length (should be 16 characters)")
    end
    it "card_companyが空ならNG" do
      product = build(:creditcard, card_company: nil)
      product.valid?
      expect(product.errors[:card_company]).to include("can't be blank")
    end
    it "card_yearが空ならNG" do
      product = build(:creditcard, card_year: nil)
      product.valid?
      expect(product.errors[:card_year]).to include("can't be blank")
    end
    it "card_monthが空ならNG" do
      product = build(:creditcard, card_month: nil)
      product.valid?
      expect(product.errors[:card_month]).to include("can't be blank")
    end
    it "card_passが空ならNG" do
      product = build(:creditcard, card_pass: nil)
      product.valid?
      expect(product.errors[:card_pass]).to include("can't be blank")
    end
    it "card_passが3桁未満ならNG" do
      product = build(:creditcard, card_pass: "11")
      product.valid?
      expect(product.errors[:card_pass]).to include("is too short (minimum is 3 characters)")
    end
    it "card_passが5桁以上ならNG" do
      product = build(:creditcard, card_pass: "11111")
      product.valid?
      expect(product.errors[:card_pass]).to include("is too long (maximum is 4 characters)")
    end
  end
end