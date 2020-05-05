class LineItem < ApplicationRecord
  
  has_many :line_items, dependent: :destroy
  
  belongs_to :order, optional: true
  belongs_to :product, optional: true
  belongs_to :cart
  
  
  
  def total_price
    product.price * quantity
  end

  
end
