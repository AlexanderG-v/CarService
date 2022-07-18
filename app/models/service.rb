class Service < ApplicationRecord
  belongs_to :category
  belongs_to :executor
  belongs_to :order
  
  validates :title, presence: true
end
