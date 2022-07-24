class Order < ApplicationRecord
  has_many :services, dependent: :destroy

  accepts_nested_attributes_for :services, reject_if: :all_blank, allow_destroy: true

  validates :customer_name, presence: true
end
