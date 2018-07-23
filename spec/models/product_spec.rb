require 'rails_helper'

describe Product do

  before :each do

    @a_quantity = 10
    @a_price= 400000
    @a_category = Category.new( name: 'Electronics')
    @apple = Product.new(
      name: 'Apple Laptop',
      quantity: @a_quantity,
      price_cents: @a_price,
      category: @a_category )
  end

  it 'should have name' do
    expect(@apple.name).to be_present
  end

  it 'should have quantity' do
    expect(@apple.quantity).to be_present
  end

  it 'should have category' do
    expect(@apple.category).to be_present
  end

  it 'should have price' do
    expect(@apple.price).to be_present
  end


end

