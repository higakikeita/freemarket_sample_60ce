require 'rails_helper'

describe User do
  describe '#create' do
    it "全て入力されていればOK" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "nicknameが空ならNG" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    it "emailが空ならNG" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "passwordが空ならNG" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    it "first_nameが空ならNG" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    it "last_nameが空ならNG" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end
    it "first_name_kanaが空ならNG" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end
    it "last_name_kanaが空ならNG" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end
    it "birthdayが空ならNG" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end
  end
end