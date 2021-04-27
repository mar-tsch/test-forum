require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "#create" do
    it "is succesfully created" do
      user = User.create(username: "toto", age: 20, mail: "toto@test.com", password: "123456")
      post = Post.create(content: "Hello world", user_id: user[:id])
      Comment.create(content: "I'm sorry Dave", user_id: user[:id], post_id: post[:id])
      expect(post.comments.count).to eq(1)
    end
  end
  describe "#destroy" do
    it "is succesfully deleted" do
      user = User.create(username: "toto", age: 20, mail: "toto@test.com", password: "123456")
      post = Post.create(content: "Hello world", user_id: user[:id])
      comment = Comment.create(content: "I'm sorry Dave", user_id: user[:id], post_id: post[:id])
      Comment.destroy(comment[:id])
      expect(post.comments.count).to eq(0)
    end
    it "is deleted when related post is deleted" do
      user = User.create(username: "toto", age: 20, mail: "toto@test.com", password: "123456")
      post = Post.create(content: "Hello world", user_id: user[:id])
      Comment.create(content: "I'm sorry Dave", user_id: user[:id], post_id: post[:id])
      Post.destroy(post[:id])
      expect(Comment.count).to eq(0)
    end
    it "is deleted when related user is deleted" do
      user = User.create(username: "toto", age: 20, mail: "toto@test.com", password: "123456")
      post = Post.create(content: "Hello world", user_id: user[:id])
      Comment.create(content: "I'm sorry Dave", user_id: user[:id], post_id: post[:id])
      User.destroy(user[:id])
      expect(Comment.count).to eq(0)
    end
  end
end
