require 'spec_helper'

describe "posts/edit.html.erb" do
  before(:each) do
    @posts = [stub_model(Post, :id => 1, :title => 'testedit1', :body => "body1")]
    @post = @posts[0]
    #assign(:posts, @posts)
    render
  end
  
  it "should have a form with id #edit_post" do
    render
    rendered.should have_selector("form#edit_post")
  end  

  it "should submit to /post/:id with a put method" do
    render
    rendered.should have_selector("form#edit_post[action='#{update_path(@post)}']")
    rendered.should have_selector("form#edit_post[method='post']")
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
    rendered.should have_selector("textarea#post_body[name='post[body]']")
    rendered.should have_field("post[body]")
  end
  
  it "should have a label 'Body' for the field #post_body" do
    render
    rendered.should have_selector("label[for='post_body']", :text => 'Body')
  end


  it "should have a submit button displaying Update post" do
    render
    rendered.should have_button("Update Post")
  end
  
  it "should display one post with its title and its body" do
      rendered.should have_selector("input#post_title[name='post[title]']", :value => @post.title)
      rendered.should have_selector("textarea#post_body[name='post[body]']", :value => @post.body)
  end
  
  it "should have a back button displaying" do
    render
    rendered.should have_link("Back", :href => root_path)
  end



end
