require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should create a product if all of the validations are true' do
      @category = Category.new(name: "HIHOWAREYOU")
      @product = Product.new(name: "Where did I go wrong", price_cents: 3500, quantity: 35, :category => @category)
      @product.valid?
      expect(@product.errors).not_to include("can\'t be blank")
    end

    it 'should not create a product if name is missing' do
      @category = Category.new(name: "HIHOWAREYOU")
      @product = Product.new(name: nil, price_cents: 3500, quantity: 35, :category => @category)
      @product.valid?
      expect(@product.errors).not_to include("can\'t be blank")
    end

    it 'should not create a product if price is missing' do
      @category = Category.new(name: "HIHOWAREYOU")
      @product = Product.new(name: "Where did I go wrong", price_cents: nil, quantity: 35, :category => @category)
      @product.valid?
      expect(@product.errors).not_to include("can\'t be blank")
    end

    it 'should not create a product if qunatity is missing' do
      @category = Category.new(name: "HIHOWAREYOU")
      @product = Product.new(name: "Where did I go wrong", price_cents: 3500, quantity: nil, :category => @category)
      @product.valid?
      expect(@product.errors).not_to include("can\'t be blank")
    end

    it 'should not create a product if category is missing' do
      @category = nil
      @product = Product.new(name: "Where did I go wrong", price_cents: 3500, quantity: 35, :category => @category)
      @product.valid?
      expect(@product.errors).not_to include("can\'t be blank")
    end
  
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end





# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true

# @category = Category.find(params[:id])
# @products = @category.products.order(created_at: :desc)