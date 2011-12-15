require 'spec_helper'

describe "ListComments" do
  before(:each) do
    @post = Post.create(:title => 'post1', :body => "body1")
    @comments = [Comment.create(:author => 'Barney', :body => "Legendary", :post_id => @post.id),
              Comment.create(:author => 'Marshall', :body => "Lily", :post_id => @post.id),
              Comment.create(:author => 'Ted', :body => "Robin", :post_id => @post.id)]
    visit post_path(@post.id)
  end
  describe "GET /posts/:id" do
    it "should display the post title and body with all the comments" do
      page.should have_content @post.title
      page.should have_content @post.body      
      @comments.each{|c| 
        page.should have_content c.author
        page.should have_content c.body    
      }        
    end
    
    it "should display a link to create a new comment" do
      page.should have_button("Create a new Comment")#, :href => new_comment_path(@post.id))
      #page.should have_xpath('/posts/(@post.id)/comments/new')
    end
  end
end
