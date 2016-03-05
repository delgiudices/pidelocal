class Order < ActiveRecord::Base

  has_many :order_items
  belongs_to :user
  belongs_to :store

  def self.from(cart:, shipping_address:, billing_information: nil)
    order = Order.new
    order.subtotal = 0
    cart.shopping_cart_items.each do |item|
      order_item = OrderItem.new(
        name: item.item.name,
        price: item.price,
        quantity: item.quantity)
      order.order_items.append(order_item)
      order.subtotal += item.price * item.quantity
    end
    order.address = shipping_address.address
    order.name = shipping_address.name
    order.phone = shipping_address.phone
    order.shipping = shipping_address.fee
    order.tax = (order.subtotal + order.shipping) * (cart.tax_pct / 100)
    order.total = order.subtotal + order.shipping + order.tax
    return order
  end

  def place
    save
  end

end
