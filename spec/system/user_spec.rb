require 'rails_helper'
describe 'User registration test', type: :system do

  context 'when you sign up' do
    it 'registers new users' do
      visit new_user_path
      fill_in "name",         with: "Example User"
      fill_in "email",        with: "user@example.com"
      fill_in "password",     with: "foobar"
      fill_in "password_confirmation", with: "foobar"
      expect{ click_button "Create User" }.to change(User, :count).by(1)
    end
  end
end
