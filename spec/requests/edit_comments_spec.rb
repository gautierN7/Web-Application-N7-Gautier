require 'spec_helper'

describe "EditComments" do
  
  before(:each) do
    @user = User.create!(:email => "zqezinezez@aol.com", :password => "Azerty", :password_confirmation => "Azerty")
    visit new_user_session_path  
    fill_in("user_email", :with => @user.email)  
    fill_in("user_password", :with => @user.password)
    click_button("Sign in")
    
    @post = Post.create(:title => 'YouHou', :body => "HiHiHiHi")
    @comments = [Comment.create(:author => 'zqezinezez@aol.com', :body => "10", :post_id => @post.id),
                 Comment.create(:author => 'zqezinezez@aol.com', :body => "3", :post_id => @post.id),
                 Comment.create(:author => 'zqezinezez@aol.com', :body => "7", :post_id => @post.id)]
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
      within("li", :text => @comment.body) do
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
        #fill_in("Author", :with => "Clark Kent") # Test impossible depuis l'interdiction de modif de l'author lors d'un edit
        fill_in("Body", :with => "MonCommentaire") 
        click_button("Update Comment")
        current_path.should == post_path(@post.id)       
        #page.should have_content("Clark Kent") # Test impossible depuis l'interdiction de modif de l'author lors d'un edit
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
