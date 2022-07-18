class Category < ApplicationRecord
  has_many :services, dependent: :destroy

  validates :title, presence: true
end
