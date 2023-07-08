require 'rails_helper'

RSpec.describe 'Category', type: :feature do
  include Devise::Test::IntegrationHelpers
  describe 'index' do
    before(:each) do
      @user = User.create(name: 'Ameerah', email: 'Ameerah@mail.com', password: 'Ameerah@2020')
      sign_in @user
      @category = Category.create(user: @user, name: 'Vacation', icon: 'photo.jpg')
      @payment = Payment.create(author: @user, name: 'Las Vegas', amount: 1200)
      @category.payments << @payment
      visit user_category_payments_path(@user, @category)
    end
    it 'renders name of category' do
      expect(page).to have_content(@category.name)
    end

    it 'renders name of category' do
      expect(page).to have_content(@payment.name)
    end

    it 'renders name of category' do
      expect(page).to have_content(@payment.amount)
    end


    it 'should render a button add food ' do
      expect(page).to have_content('Sign out')
    end
  end
end
