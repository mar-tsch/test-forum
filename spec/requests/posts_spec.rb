require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "#index" do
    before { get posts_path }
    it "is a success" do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
  end
  describe "#create" do
    it "successfully creates a new post" do
      user = User.create(username: "toto", age: 21, mail: "toto@test.com", password: "123456")
      post = Post.create(content: "Hello world", user_id: user[:id])
      expect(Post.count).to eq(1)
    end
  end
  describe "#destroy" do
    it "successfully destroys a post" do
      user = User.create(username: "toto", age: 21, mail: "toto@test.com", password: "123456")
      post = Post.create(content: "Hello world", user_id: user[:id])
      Post.destroy(post[:id])
      expect(Post.count).to eq(0)
    end
  end
end
