class Order < ApplicationRecord
  has_many :services, dependent: :destroy

  validates :customer_name, presence: true
end
