require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'Ameerah', email: 'ameerah@gamil.com', password: '123456')
    sign_in @user
  end
  describe 'GET /index' do
    it 'returns a successful response' do
      get user_categories_path(@user)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'returns a successful response' do
      get user_categories_path(@user)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid attributes' do
      it 'creates a new category' do
        expect do
          post user_categories_path(user_id: @user.id),
               params: { category: { name: 'Vacation', icon: 'photo.jpg', user: @user } }
        end.to change(Category, :count).by(1)
        expect(response).to redirect_to(user_categories_path)
        follow_redirect!
        expect(response).to be_successful
      end
    end
  end
end
