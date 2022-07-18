require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should have_many(:services).dependent(:destroy) }

  it { should accept_nested_attributes_for :services }

  it { should validate_presence_of :customer_name }
end
