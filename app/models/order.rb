class Order < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
  
  PAYMENT_TYPES = [ "Cheque" , "Credit card" , "Debit Card" ]
  DELIVERY_TYPES = [["Next Day","First Class","Second Class"],['&pound;5.99', '&pound;2.99','&pound;1.99']]
  validates :name, :address, :email, :pay_type, :delivery_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES
end
