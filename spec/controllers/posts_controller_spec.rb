require 'spec_helper'

describe PostsController do

  describe "POST create" do
    it "should redirect to the post list" do
      post :create
      response.should redirect_to posts_path
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

end
