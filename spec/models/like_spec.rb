require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "creation" do
    it "can be created" do
      user = User.create(username: "toto", age: 20, mail: "toto@test.com", password: "123456")
      post = Post.create(content: "Hello world", user_id: user[:id])
      Like.create(user_id: user[:id], post_id: post[:id])
      expect(post.likes.count).to eq(1)
    end
  end
end
