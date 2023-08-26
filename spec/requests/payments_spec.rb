require 'rails_helper'

RSpec.describe 'Payments', type: :request do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'Ameerah', email: 'ameerah@gamil.com', password: '123456')
    @categories = Category.create(name: 'vacation', icon: 'photo.jpg', user: @user)
    sign_in @user
  end
  describe 'GET /index' do
    it 'returns a successful response' do
      get user_category_payments_path(@user, @categories)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'returns a successful response' do
      get user_category_payments_path(@user, @categories)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid attributes' do
      it 'creates a new Transaction' do
        expect do
          post user_category_payments_path(user_id: @user.id, category_id: @categories.id),
               params: { payment: { name: 'Vacation', amount: 1200, author: @user } }
        end.to change(Payment, :count).by(1)
        expect(flash[:notice]).to eq('Transaction created successfully!')
      end
    end
  end
end
