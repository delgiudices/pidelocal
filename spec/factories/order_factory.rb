FactoryGirl.define do

  factory :order do

    subtotal 95
    shipping  5
    tax 18
    total 118

  end

  factory :order_item do
    name "Un item pila de vacano"
    price 95
    quantity 1
  end
end
