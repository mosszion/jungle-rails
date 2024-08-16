require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:category) { Category.create(name: 'Electronics') }

  describe 'Validations' do
    # validation tests/examples here
    context 'when all fields are set correctly' do
      it 'is valid with all attributes present' do
        product = Product.new(name: 'Valid Product', price_cents: 1000, quantity: 5, category: category)
        expect(product).to be_valid
        expect(product.save).to be true
      end
    end
    context 'when name is not present' do

      it 'is invalid without a name' do
        product = Product.new(name: nil, price_cents: 1000, quantity: 5, category:category)
        expect(product).not_to be_valid
        expect(product.errors[:name]).to include("can't be blank")
      end
    end
    context 'when price is not present' do

      it 'is invalid without a price' do
        product = Product.new(name: "Andy", price_cents: nil, quantity: 5, category:category)
        expect(product).not_to be_valid
        expect(product.errors.full_messages).to include("Price can't be blank")
      end
    end
    context 'when quantity is not present' do
      it 'is invalid without a quantity' do
        product = Product.new(name: 'Test Product', price_cents: 1000, quantity: nil, category: category)
        expect(product).not_to be_valid
        expect(product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    context 'when category is not present' do
      it 'is invalid without a category' do
        product = Product.new(name: 'Test Product', price_cents: 1000, quantity: 5, category: nil)
        expect(product).not_to be_valid
        expect(product.errors.full_messages).to include("Category can't be blank")
      end
    end

  end
end
