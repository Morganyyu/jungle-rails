require 'rails_helper'

RSpec.feature "User logs in and redirects to homepage", type: :feature, js: true do
  before :each do
    @user = User.create!(
      name: 'First User',
      email: 'first@user.com',
      password: '123456',
      password_confirmation: '123456'
    )
  end

  scenario "They login" do
    visit '/login'

    within 'form' do
      fill_in id: 'email', with: 'first@user.com'
      fill_in id: 'password', with: '123456'

      click_button 'Submit'
    end
    expect(page).to have_css "section.products-index"
  end

end