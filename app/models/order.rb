class Order < ApplicationRecord
  validates :customer_name, presence: true
end
