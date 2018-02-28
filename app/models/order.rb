class Order < ApplicationRecord
  has_one   :client
  has_one   :user
  has_many  :products
end
