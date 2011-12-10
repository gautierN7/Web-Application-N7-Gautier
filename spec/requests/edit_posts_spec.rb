require 'spec_helper'

describe "EditPosts" do
  before(:each) do
    @posts = [Post.create(:title => 'Edit1', :body => "Abody11"),
              Post.create(:title => 'Edit2', :body => "Abody22"),
              Post.create(:title => 'Edit3', :body => "Abody33")]
    @post = @posts[1]
    visit posts_path
  end  
  
  describe "a post in the list" do
    it "should have a edit button" do
      @posts.each{|post| page.should have_link("Edit this Post", :href => edit_post_path(post), :method => 'edit')}
    end
  end
  
  describe "after a click on the Edit link on the 2nd post" do
    it "should display the 2nd post edit view" do
      within("li", :text => @post.title) do
        click_on "Edit this Post"
      end
      current_path.should == "/posts/edit/#{@post.id}"
    end
    it "should display the post title and body" do    
        page.should have_content(@post.title)
        page.should have_content(@post.body)
    end
    it "should modify the title and body" do
        visit edit_post_path(@post.id)
        fill_in("Title", :with => "Post 11")
        fill_in("Body", :with => "Body 11") 
        click_button("Update Post")
        current_path.should == post_path(@post)       
      page.should have_content("Post 11")
      page.should have_content("Body 11")
    end    
    it "should have a back button displaying" do
        visit post_path(@post.id)
        page.should have_button("Back")
        click_button("Back")  
        current_path.should == root_path
    end
  end
end
