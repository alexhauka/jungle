require 'rails_helper'

RSpec.feature "Visitor navigates to product details", type: :feature, js: true do
  
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


  scenario "They see all products" do
    # ACT
    visit root_path

    expect(page).to have_css 'article.product', count: 10

    page.find('article.product:first-child').click_on "Details"

    expect(page).to have_content("Name")

    save_screenshot

  end



end
