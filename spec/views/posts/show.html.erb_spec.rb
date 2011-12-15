require 'spec_helper'

describe "posts/show.html.erb" do
  before(:each) do
    @posts = assign(:post, stub_model(Post, :id => 1, :title => 'tesatshow1', :body => "body1"))
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

  # Commentaire
  before(:each) do
    @post = assign(:post, stub_model(Post, :id => 1, :title => 'tesatshow1', :body => "body1"))
    @comments = [Comment.create(:author => 'Barney', :body => "Legendary", :post_id => @post.id),
                 Comment.create(:author => 'Marshall', :body => "Lily", :post_id => @post.id),
                 Comment.create(:author => 'Ted', :body => "Robin",  :post_id => @post.id)]
    assign(:comments, @comments)
    render
  end
  
  it "should display a list identified by 'comments'" do
    rendered.should have_selector("ul#comments")
  end
  
  it "should display each comment in the list with its author and its body" do
    @comments.each do |comment|
      rendered.should have_selector("ul#comments li#comment_#{comment.id}", :text => comment.author)
      rendered.should have_selector("ul#comments li#comment_#{comment.id}", :text => comment.body)
    end
  end
  
  it "should have a create new comment button displaying" do
    render
    rendered.should have_button("Create a new Comment")
  end
  
  it "should display each post in the list with a delete link" do
   @comments.each do |comment|
      rendered.should have_selector("li#comment_#{comment.id} a", :text => "Delete this Comment")
   end
  end
end
