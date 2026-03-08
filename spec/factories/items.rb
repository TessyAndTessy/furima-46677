FactoryBot.define do
  factory :item do
    association :user

    name { 'テスト商品' }
    info { 'テスト説明' }
    category_id { 2 }
    status_id { 2 }
    shipping_fee_status_id { 2 }
    prefecture_id { 2 }
    delivery_schedule_id { 2 }
    price { 500 }

    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('public/images/test_image.png')),
        filename: 'test_image.png',
        content_type: 'image/png'
      )
    end
  end
end
