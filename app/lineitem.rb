class Lineitem < ApplicationRecord
#class Lineitem <ActiveRecord :: Base64
  belongs_to :product
  belongs_to :cart
end
