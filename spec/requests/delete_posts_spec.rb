require 'spec_helper'

describe "DeletePosts" do
  before(:each) do
    @posts = [Post.create(:title => 'Post1', :body => "body1"),
              Post.create(:title => 'Post2', :body => "body2"),
              Post.create(:title => 'Post3', :body => "body3")]
    @post = @posts[1]
    visit posts_path
  end

  describe "a post in the list" do
    it "should have a delete button" do
      visit posts_path
      @posts.each{|post| page.should have_link("Delete this Post", :href => post_path(post), :method => 'delete')}
    end
  end

  describe "after a click on the delete link on the 2nd post" do
    it "should display the list without the post2" do
      within("li", :text => @post.title) do
        click_on "Delete this Post"
      end
      page.should_not have_content(@post.title)
      page.should_not have_content(@post.body)
    end
  end
end
