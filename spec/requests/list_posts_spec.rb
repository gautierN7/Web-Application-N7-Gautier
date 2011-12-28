require 'spec_helper'

describe "Listposts" do

  before(:each) do
    @posts = [Post.create(:title => 'post1', :body => "body1"),
              Post.create(:title => 'post2', :body => "body2"),
              Post.create(:title => 'post3', :body => "body3")]
    visit posts_path
  end
    
  describe "GET /posts" do
    it "should display each post title and body" do
      @posts.each{|p| 
      page.should have_content p.title
      page.should have_content p.body      
      }

    end

    it "should display a link to create a new post" do
      page.should have_link("Create a new Post", :href => new_post_path)
    end
  end
end
