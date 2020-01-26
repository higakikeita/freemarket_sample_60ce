require 'rails_helper'
describe Product do  
  describe '#create' do
    it "is invalid without a nickname" do
     user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
     user.valid?
     expect(user.errors[:nickname]).to include("can't be blank")
    end
  end
end