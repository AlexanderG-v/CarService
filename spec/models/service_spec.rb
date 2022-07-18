require 'rails_helper'

RSpec.describe Service, type: :model do
  it { should belong_to :category }
  it { should belong_to :executor }
  it { should belong_to :order }
  
  it { should validate_presence_of :title }
end
