require 'spec_helper'

describe "posts/new.html.erb" do
  before(:each) do
    assign(:post, "Post.new")
  end

  it "should have a form with id #new_post" do
    render
    rendered.should have_selector("form#new_post")
  end  

  it "should submit to /posts with a post method" do
    render
    rendered.should have_selector("form#new_post[action='#{posts_path}']")
    rendered.should have_selector("form#new_post[method='post']")
  end
  
  
  it "should have a field named post[title] and identified by #post_title" do
    render
    rendered.should have_selector("input#post_title[name='post[title]']")
    rendered.should have_field("post[title]")
  end
  
  it "should have a label 'Title' for the field #post_title" do
    render
    rendered.should have_selector("label[for='post_title']", :text => 'Title')
  end
  
  it "should have a field named post[body] and identified by #post_body" do
    render
    rendered.should have_selector("input#post_body[name='post[body]']")
    rendered.should have_field("post[body]")
  end
  
  it "should have a label 'Body' for the field #post_body" do
    render
    rendered.should have_selector("label[for='post_body']", :text => 'Body')
  end


  it "should have a submit button displaying Create post" do
    render
    rendered.should have_button("Create Post")
  end
  
  it "should have a back button displaying" do
    render
    rendered.should have_button("Back")
  end
end
