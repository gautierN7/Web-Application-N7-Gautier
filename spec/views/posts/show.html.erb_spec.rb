require 'spec_helper'

describe "posts/show.html.erb" do
  before(:each) do
    @posts = [stub_model(Post, :id => 1, :title => 'tesatshow1', :body => "body1")]
    @post = @posts[0]
    #assign(:posts, @posts)
    render
  end
  
  it "should have a label 'Title' for the #post_title" do
    rendered.should have_selector("label[for='post_title']", :text => 'Title')
  end
  
  it "should have a label 'Body' for the #post_body" do
    rendered.should have_selector("label[for='post_body']", :text => 'Body')
  end

  it "should display one post with its title and its body" do
      #### PAS BON A REVOIR ###
      rendered.should have_selector("body", :text => @post.title)
      rendered.should have_selector("body", :text => @post.body)
  end
  
  it "should have a back button displaying" do
    render
    rendered.should have_button("Back")
  end
end
