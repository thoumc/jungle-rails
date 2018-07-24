require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name: Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end


  scenario "Users should be able to add to carts" do
    visit root_path
    page.find('article footer').find('#add').click
    # expect(page).to
    expect(page).to have_css('#cart', text: 'My Cart (1)')
    save_screenshot
  end



end
