require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(name: 'seth',
                        email: 'cool@q.com', password: '12345678')
    @user2 = User.new(name: 'seth',
                      email: 'coolssa@q.com', password: '12345678')
  end
  context 'tests the user model creation' do
    it 'create valid user' do
      expect(@user.valid?).to eq(true)
    end

    it 'creates an invalid user duplicate email' do
      @user = User.new(name: 'Hello my name is awesomo-3000',
                       email: 'cool@q.com',
                       password: '12345678',
                       password_confirmation: '12345678')
      expect(@user.valid?).to eq(false)
    end
    it 'creates an invalid user duplicate name' do
      expect(@user2.valid?).to eq(false)
    end
  end
end
