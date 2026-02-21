FactoryBot.define do
  factory :user do
    nickname { 'furima太郎' }
    email { Faker::Internet.email }
    password { 'abc123' }
    password_confirmation { password }
    last_name  { '山田' }
    first_name { '陸太郎' }
    last_name_kana  { 'ヤマダ' }
    first_name_kana { 'リクタロウ' }
    birthday { Date.new(1990, 1, 1) }
  end
end
