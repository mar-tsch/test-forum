require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    it "can be created" do
      user = User.create(username: "toto", age: 20, mail: "toto@test.com", password: "123456")
      expect(user).to be_valid
    end
  end
  context 'validation test' do
    it 'ensures username presence' do
      user = User.new(
        username: 'toto',
        mail: 'test@test.com',
        password: '123456'
      ).save
      expect(user).to eq(false)
    end
    it 'ensures mail presence' do
      user = User.new(
        username: 'toto',
        mail: 'test@test.com',
        password: '123456'
      ).save
      expect(user).to eq(false)
    end
    it 'ensures username uniqueness' do
      user = User.new(
        username: 'toto',
        mail: 'test@test.com',
        password: '123456'
      ).save
      user_1 = User.new(
        username: 'toto',
        mail: 'test@test.com',
        password: '123456'
      ).save
      expect(user_1).to eq(false)
    end
  end
end
