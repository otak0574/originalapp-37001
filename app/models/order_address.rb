class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :pref_id, :city, :house_number, :building_name, :phone_number, :price, :customer_id, :store_id, :cart_id, :token

  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: 'is invalid'}
    validates :pref_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :customer_id
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は不正な値です。' }
  end
  validates :pref_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    binding.pry
    order = Order.create(price: price, customer_id: customer_id, store_id: store_id, cart_id: cart_id)
    customer = Customer.find(customer_id)
    address = customer.address
    address_id = address.id
      if address_id.present?
        address = Address.find(address_id)
        address.update(postal_code: postal_code, pref_id: pref_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
      else
        Address.create(postal_code: postal_code, pref_id: pref_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
      end
  end
end