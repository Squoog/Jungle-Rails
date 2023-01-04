require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context 'name field is left blank' do
      it 'will produce an error saying that a name is required' do
        category = Category.new(name: 'Flowers')
        product = Product.new(price: 30, quantity: 100, category: category)
        product.save

        expect(product.errors.full_messages).to include("Name can't be blank")
      end
    end

    context 'price field is left blank' do
      it 'will produce an error saying that a price is required' do
        category = Category.new(name: 'Flowers')
        product = Product.new(name: 'Oddish', quantity: 100, category: category)
        product.save

        expect(product.errors.full_messages).to include("Price can't be blank")
      end
    end

    context 'quantity field is left blank' do
      it 'will produce an error saying that a name is required' do
        category = Category.new(name: 'Flowers')
        product = Product.new(name: 'Oddish', price: 30, category: category)
        product.save

        expect(product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    context 'category is not given' do
      it 'will produce an error saying that a name is required' do
        category = Category.new(name: 'Flowers')
        product = Product.new(name: 'Oddish', price: 30, quantity: 100)
        product.save

        expect(product.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end