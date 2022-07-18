class Order < ApplicationRecord
  has_many :services, dependent: :destroy

  accepts_nested_attributes_for :services, allow_destroy: true

  validates :customer_name, presence: true
end
