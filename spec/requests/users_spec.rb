require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "#index" do
    before { get users_path }
    it "is a success" do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
  end
  describe "#create" do
    it "successfully creates a new user" do
      user = User.create(username: "toto", age: 21, mail: "toto@test.com", password: "123456")
      expect(User.last.username).to eq("toto")
    end
    it "does not accept a user with incorrect params" do
      user = User.create(username: "", age: 21, mail: "toto@test.com", password: "123456")
      expect(User.count).to eq(0)
    end
  end
  describe "#destroy" do
    it "successfully destroys a user" do
      user = User.create(username: "toto", age: 21, mail: "toto@test.com", password: "123456")
      post = Post.create(content: "Hello world", user_id: user[:id])
      User.destroy(user[:id])
      expect(User.count).to eq(0)
    end
    it "successfully destroys a user's posts" do
      user = User.create(username: "toto", age: 21, mail: "toto@test.com", password: "123456")
      post = Post.create(content: "Hello world", user_id: user[:id])
      User.destroy(user[:id])
      expect(Post.where(user_id: user[:id]).count).to eq(0)
    end
  end
end
