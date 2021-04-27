require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do
    it "can be created" do
      user = User.create(username: "toto", age: 20, mail: "toto@test.com", password: "123456")
      post = Post.create(content: "Hello world", user_id: user[:id])
      expect(post).to be_valid
    end
  end
end
