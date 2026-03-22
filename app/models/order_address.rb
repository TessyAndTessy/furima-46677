class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id,
                :city, :address_line, :building, :phone_number, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'は「3桁ハイフン4桁」の半角文字列の形式で入力してください' }
    validates :city
    validates :address_line
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁以上11桁以内の半角数値で入力してください' }
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      address_line: address_line,
      building: building,
      phone_number: phone_number,
      order_id: order.id
    )
  end
end
