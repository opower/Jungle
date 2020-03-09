require 'rails_helper'

RSpec.describe Product, type: :model do
  category = Category.new(name: 'Books')
  subject {
    described_class.new(id: 1,
                        name: 'Red Bookself',
                        price_cents: 10.0,
                        quantity: 20,
                        category: category)
  }
  
  describe 'Validations' do
    # validation tests/examples here
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it 'should validate that a name exist' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'should validate price exisit' do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end
    it 'should validate quantity exisit' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end
    it 'should validate price exisit' do
      subject.category = nil
      expect(subject).to_not be_valid
    end

  end
end
