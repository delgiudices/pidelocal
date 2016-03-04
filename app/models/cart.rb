class Cart < ActiveRecord::Base

  acts_as_shopping_cart_using :cart_item

  def tax_pct
    18.0
  end

  def shipping
    75.00
  end

  def tax
    ( (subtotal + shipping) * (tax_pct / 100) ).round(2)
  end

  def total
    subtotal + shipping + tax
  end


end
