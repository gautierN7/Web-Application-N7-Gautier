require 'spec_helper'

describe "comments/new.html.erb" do
  before(:each) do
  	@post = Post.create(:title => "Postzdzd11", :body => "blzdzddzdla")
    assign(:comment, Comment.new)
  end

  it "should have a form with id #new_comment" do
    render
    rendered.should have_selector("form#new_comment")
  end  

  it "should submit to post_path with a post method" do
    render
    rendered.should have_selector("form#new_comment[action='#{post_path(@post.id)}']")
    rendered.should have_selector("form#new_comment[method='post']")
  end
  
  
  it "should have a field named comment[author] and identified by #comment_author" do
    render
    rendered.should have_selector("input#comment_author[name='comment[author]']")
    rendered.should have_field("comment[author]")
  end
  
  it "should have a label 'author' for the field #comment_author" do
    render
    rendered.should have_selector("label[for='comment_author']", :text => 'Author')
  end
  
  it "should have a field named comment[body] and identified by #comment_body" do
    render
    rendered.should have_selector("textarea#comment_body[name='comment[body]']")
    rendered.should have_field("comment[body]")
  end
  
  it "should have a label 'Body' for the field #comment_body" do
    render
    rendered.should have_selector("label[for='comment_body']", :text => 'Body')
  end


  it "should have a submit button displaying Create comment" do
    render
    rendered.should have_button("Create Comment")
  end
  
  it "should have a back button displaying" do
    render
    rendered.should have_link("Back", :href => post_path(@post.id))
  end
end
