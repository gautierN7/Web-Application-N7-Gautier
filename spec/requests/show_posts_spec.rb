require 'spec_helper'

describe "ShowPost" do
  before(:each) do
    @posts = [Post.create(:title => 'Chapitre1', :body => "Abody1"),
              Post.create(:title => 'Chapitre2', :body => "Abody2"),
              Post.create(:title => 'Chapitre3', :body => "Abody3")]
    @post = @posts[1]
    visit posts_path
  end
  
  describe "a post in the list" do
    it "should have a show button" do
      @posts.each{|post| page.should have_link("Show this Post", :href => post_path(post), :method => 'show')}
    end
  end
  
  describe "after a click on the Show link on the 2nd post" do
    it "should display the 2nd post view" do
      within("li", :text => @post.title) do
        click_on "Show this Post"
      end
      current_path.should == post_path(@post.id)
    end
    it "should display the post title and body" do    
      page.should have_content(@post.title)
      page.should have_content(@post.body)
    end
    it "should have a back button displaying" do
        visit post_path(@post.id)
        page.should have_button("Back")
        click_button("Back")  
        current_path.should == root_path
    end
  end
end
