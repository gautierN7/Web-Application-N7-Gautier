require 'spec_helper'

describe "DeletePosts" do
  before(:each) do
    @user = User.create!(:email => "gautier@aol.com", :password => "Azerty", :password_confirmation => "Azerty")
    visit new_user_session_path  
    fill_in("user_email", :with => @user.email)  
    fill_in("user_password", :with => @user.password)
    click_button("Sign in")
    @posts = [Post.create(:title => 'Chapitre1', :body => "Abody1"),
              Post.create(:title => 'Chapitre2', :body => "Abody2"),
              Post.create(:title => 'Chapitre3', :body => "Abody3")]
    @post = @posts[1]
    visit posts_path
  end

  describe "a post in the list" do
    it "should have a delete button" do
      @posts.each{|post| page.should have_link("Delete this Post", :href => post_path(post), :method => 'delete')}
    end
  end

  describe "after a click on the delete link on the 2nd post" do
    it "should display the list without the post2" do
      within("li", :text => @post.title) do
        click_on "Delete this Post"
      end
      current_path.should == posts_path
      
      if (@user.id == @post.user_id)      
          page.should_not have_content(@post.title)
          page.should_not have_content(@post.body)
      else
          page.should have_content(@post.title)
          page.should have_content(@post.body)
      end
    end
  end
end
