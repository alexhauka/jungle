require 'rails_helper'

RSpec.feature "A user can log in", type: :feature, js: true do
  
  before :each do
    @user = User.create!(
      first_name: "John",
      last_name: "Doe",
      email: "example@domain.com",
      password: "poopypants",
      password_confirmation: "poopypants"
    )
  end

  scenario "They see their first name in the nav bar" do
    # ACT
    visit root_path

    expect(page).to have_content("Login")
    
    page.find('div#navbar').click_on "Login"
    
    expect(page).to have_css 'form label'

    fill_in "Email", with: "example@domain.com"

    fill_in "Password", with: "poopypants"

    click_on "Submit"

    expect(page).to have_content("John")
    
    save_screenshot

  end


end
