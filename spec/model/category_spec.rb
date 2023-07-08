require 'rails_helper'

RSpec.describe Category, type: :model do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'Ameerah', email: 'Ameerah@gmail.com', password: '123456')
    sign_in @user
  end
  describe 'Validations' do
    it 'is valid with valid attributes' do
      user = User.create(name: 'Ameerah', email: 'Ameerah@gmail.com', password: '123456')
      category = Category.new(
        name: 'Vacation',
        icon: 'photo.jpg',
        user:
      )
      expect(category).to be_valid
    end

    it 'requires name to be present' do
      category = Category.new(
        name: '',
        icon: 'photo.jpg'
      )
      expect(category).to_not be_valid
    end

    it 'requires icon to be present' do
      category = Category.new(
        name: 'Vacation',
        icon: ''
      )
      expect(category).to_not be_valid
    end
  end
end
