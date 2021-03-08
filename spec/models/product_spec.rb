require 'rails_helper'

RSpec.describe Product, type: :model do

  before do
    @category = Category.create name: 'junk'
  end

  describe 'Validations' do

    it "a valid product will save successfully" do
      @product = Product.create name: 'broken watch', price: 100, quantity: 5, category_id: @category.id
      expect(@product.valid?).to be true
    end
    
    it "a product is invalid if name field left blank" do
      @product = Product.create name: nil, price: 100, quantity: 5, category_id: @category.id
      expect(@product.valid?).to be false
      # puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Name can't be blank")

    end

    it "a product is invalid if price field left blank" do
      @product = Product.create name: 'broken watch', price: nil, quantity: 5, category_id: @category.id
      expect(@product.valid?).to be false
      # puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "a product is invalid if quantity field left blank" do
      @product = Product.create name: 'broken watch', price: 100, quantity: nil, category_id: @category.id
      expect(@product.valid?).to be false
      # puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "a product is invalid if category field left blank" do
      @product = Product.create name: 'broken watch', price: 100, quantity: 5, category_id: nil
      expect(@product.valid?).to be false
      # puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end

end
