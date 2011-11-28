require 'spec_helper'

describe "posts/index.html.erb" do
  before(:each) do
    @posts = [stub_model(Post, :id => 1, :title => 'post1', :body => "body1"),
              stub_model(Post, :id => 2, :title => 'post2', :body => "body2"),
              stub_model(Post, :id => 3, :title => 'post3', :body => "body3")]
    assign(:posts, @posts)
    render
  end

  it "should display a list identified by 'posts'" do
    rendered.should have_selector("ul#posts")
  end

  it "should display each post in the list with its title and its body" do
    @posts.each do |post|
      rendered.should have_selector("ul#posts li#post_#{post.id}", :text => post.title)
      rendered.should have_selector("ul#posts li#post_#{post.id}", :text => post.body)
    end
  end

  it "should display a link to create a new post" do
    rendered.should have_link("Create a new Post", :href => new_post_path)
  end
end
