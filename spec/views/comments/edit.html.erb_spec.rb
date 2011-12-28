require 'spec_helper'

describe "comments/edit.html.erb" do
  before(:each) do
    @post = assign(:post, stub_model(Post, :id => 1, :title => 'tesatshow1', :body => "body1"))
    @comments = [Comment.create(:author => 'Barney', :body => "Legendary", :post_id => @post.id),
                 Comment.create(:author => 'Marshall', :body => "Lily", :post_id => @post.id),
                 Comment.create(:author => 'Ted', :body => "Robin",  :post_id => @post.id)]
    @comment = @comments[1]
    assign(:comment, @comment)
    render
  end
  
  it "should have a form with id #edit_comment" do
    rendered.should have_selector("form#edit_comment")
  end  

  it "should submit to /post/:id with a put method" do
    rendered.should have_selector("form#edit_comment[action='#{update_comment_path(@post, @comment)}']")
    rendered.should have_selector("form#edit_comment[method='post']")
  end
  
  
  it "should have a field named comment[author] and identified by #comment_author" do
    rendered.should have_selector("input#comment_author[name='comment[author]']")
    rendered.should have_field("comment[author]")
  end
  
  it "should have a label 'Author' for the field #comment_author" do
    rendered.should have_selector("label[for='comment_author']", :text => 'Author')
  end
  
  it "should have a field named comment[body] and identified by #comment_body" do
    rendered.should have_selector("textarea#comment_body[name='comment[body]']")
    rendered.should have_field("comment[body]")
  end
  
  it "should have a label 'Body' for the field #comment_body" do
    rendered.should have_selector("label[for='comment_body']", :text => 'Body')
  end


  it "should have a submit button displaying Update Comment" do
    render
    rendered.should have_button("Update Comment")
  end
  
 #### it "should display one post with its title and its body" do
    ####  rendered.should have_selector("input#post_title[name='post[title]']", :value => @post.title)
    #### rendered.should have_selector("input#post_body[name='post[body]']", :value => @post.body)
 #### end
  
  it "should have a back button displaying" do
    rendered.should have_button("Back")
  end



end
