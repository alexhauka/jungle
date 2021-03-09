require 'rails_helper'

RSpec.feature "User can add product to cart", type: :feature, JS: true do
  
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  
  
  scenario "They see My Cart (1)" do
    # ACT
    visit root_path

    expect(page).to have_css 'article.product', count: 10

    page.find('article.product:first-child').click_on "Add"

    expect(page).to have_content("My Cart (1)")

    # save_screenshot

  end

end
