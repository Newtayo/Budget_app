require 'rails_helper'

RSpec.describe Payment, type: :model do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'Ameerah', email: 'Ameerah@gmail.com', password: '123456')
    sign_in @user
  end
  describe 'Validations' do
    it 'is valid with valid attributes' do
      user = User.create(name: 'Ameerah', email: 'Ameerah@gmail.com', password: '123456')
      payment = Payment.new(
        name: 'Vacation',
        amount: 2000,
        author: user
      )
      expect(payment).to be_valid
    end

    it 'requires name to be present' do
      payment = Payment.new(
        name: '',
        amount: 2000
      )
      expect(payment).to_not be_valid
    end

    it 'requires name to be present' do
      payment = Payment.new(
        name: 'Vacation',
        amount: ''
      )
      expect(payment).to_not be_valid
    end
  end
end
