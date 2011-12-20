require 'spec_helper'

describe "EditComments" do
  
  before(:each) do
    @post = Post.create(:title => 'YouHou', :body => "HiHiHiHi")
    @comments = [Comment.create(:author => 'MacAlister', :body => "10", :post_id => @post.id),
                 Comment.create(:author => 'Intrus1', :body => "3", :post_id => @post.id),
                 Comment.create(:author => 'Dusautoir', :body => "7", :post_id => @post.id)]
    @comment = @comments[1]        
    visit post_path(@post.id)
  end  
    
  describe "a comment in the list" do
    it "should have a edit button" do
      @comments.each{|comment| page.should have_link("Edit this Comment", :href => edit_comment_path(@post.id, comment.id), :method => 'edit')}
      end
    end
  
  describe "after a click on the Edit link on the 2nd comment" do
    it "should display the 2nd comment edit view" do
      within("li", :text => @comment.author) do
        click_on "Edit this Comment"
      end
      current_path.should == "/posts/#{@post.id}/comments/edit/#{@comment.id}"
    end
    it "should display the comment author and body" do    
        page.should have_content(@comment.author)
        page.should have_content(@comment.body)
    end
    it "should modify the author and body" do
        visit edit_comment_path(@post.id, @comment.id)
        fill_in("Author", :with => "Clark Kent")
        fill_in("Body", :with => "MonCommentaire") 
        click_button("Update Comment")
        current_path.should == post_path(@post.id)       
        page.should have_content("Clark Kent")
        page.should have_content("MonCommentaire")
    end    
    it "should have a back button displaying" do
        visit edit_comment_path(@post.id, @comment.id)
        page.should have_button("Back")
        click_button("Back")  
        current_path.should == post_path(@post.id)
    end
  end
end