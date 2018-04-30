require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save if presense of name, price, quantity, and category are validated' do
      @category = Category.new
      @product = @category.products.new(:name => "Toothbrush", :price => 3000, :quantity => 3, :category => @category)
      @product.save!
      expect(@product).to be_valid
    end
    it 'should validate presence of name' do
      @category = Category.new
      @product = @category.products.new(:name => nil, :price => 3000, :quantity => 3, :category => @category)
      expect(@product.name).not_to be_present
      # @product.errors.full_messages
    end
    it 'should validate presence of price' do
      @category = Category.new
      @product = @category.products.new(:name => "Toothbrush", :price => nil, :quantity => 3, :category => @category)
      expect(@product.price).not_to be_present
      # expect(@product.name.errors.full_messages)
    end
    it 'should validate presence of quantity' do
      @category = Category.new
      @product = @category.products.new(:name => "Toothbrush", :price => 3000, :quantity => nil, :category => @category)
      expect(@product.quantity).not_to be_present
      # expect(@product.name.errors.full_messages)
    end
    it 'should validate presence of catergory' do
      # @category = Category.new
      @product = Product.new(:name => "Toothbrush", :price => 3000, :quantity => 3, :category => nil)
      expect(@product.category).not_to be_present
      # expect(@product.name.errors.full_messages)
    end
  end
end
