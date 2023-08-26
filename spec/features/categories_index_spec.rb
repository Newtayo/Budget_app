require 'rails_helper'

RSpec.describe 'Category', type: :feature do
  include Devise::Test::IntegrationHelpers
  describe 'index' do
    before(:each) do
      @user = User.create(name: 'Ameerah', email: 'Ameerah@mail.com', password: 'Ameerah@2020')
      sign_in @user
      @category = Category.create(user: @user, name: 'Vacation', icon: 'photo.jpg')
      visit user_categories_path(@user)
    end
    it 'renders name of category' do
      expect(page).to have_content(@category.name)
    end

    it 'renders the  category icon to the page' do
      expect(page).to have_css('img[src*="photo.jpg"]')
    end

    it 'should render have categories ' do
      expect(page).to have_content('Categories')
    end

    it 'should render have sign out ' do
      expect(page).to have_content('Sign out')
    end
  end
end
