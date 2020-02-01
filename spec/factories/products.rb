FactoryBot.define do
  factory :product do
    name                    {"自転車"}
    explain                 {"未使用のクロスバイクです"}
    category_id             {"1"}
    size                    {"FREESIZE"}
    status                  {"新品・未使用"}
    postage                 {"送料込み（出品者負担)"}
    prefecture              {"北海道"}
    shipping_date           {"4〜7日で発送"}
    price                   {"300"}
    image {File.open("#{Rails.root}/public/images/test_image.jpg")}
    trait :invalid do
      name                  {""}
    end
  end
end