require 'rails_helper'

RSpec.describe "Likes", type: :request do
  describe "#create" do
    it "can be succesfully created" do
      user = User.create(username: "toto", age: 20, mail: "toto@test.com", password: "123456")
      post = Post.create(content: "Hello world", user_id: user[:id])
      Like.create(user_id: user[:id], post_id: post[:id])
      expect(post.likes.count).to eq(1)
    end
  end
  describe "#destroy" do
    it "can be succesfully removed" do
      user = User.create(username: "toto", age: 20, mail: "toto@test.com", password: "123456")
      post = Post.create(content: "Hello world", user_id: user[:id])
      like = Like.create(user_id: user[:id], post_id: post[:id])
      Like.destroy(like[:id])
      expect(post.likes.count).to eq(0)
    end
    it "is deleted when related post is deleted" do
      user = User.create(username: "toto", age: 20, mail: "toto@test.com", password: "123456")
      post = Post.create(content: "Hello world", user_id: user[:id])
      Like.create(user_id: user[:id], post_id: post[:id])
      Post.destroy(post[:id])
      expect(Like.count).to eq(0)
    end
    it "is deleted when related user is deleted" do
      user = User.create(username: "toto", age: 20, mail: "toto@test.com", password: "123456")
      post = Post.create(content: "Hello world", user_id: user[:id])
      Like.create(user_id: user[:id], post_id: post[:id])
      User.destroy(user[:id])
      expect(Like.count).to eq(0)
    end
  end
end
