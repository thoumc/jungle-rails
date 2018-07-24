require 'rails_helper'

RSpec.feature "Visitor navigates Product Details", type: :feature, js: true do

  # setup
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

  scenario "They see all products" do
    visit root_path
    page.find('article').find('header').click
    expect(page).to have_css 'article.product-detail', count: 1
    save_screenshot
  end


end
