require 'spec_helper'

describe "DeleteComments" do
  before(:each) do
    @post = Post.create(:title => 'Wazup', :body => "Bouzincaaaa")
    @comments = [Comment.create(:author => 'Poux', :body => "1", :post_id => @post.id),
                 Comment.create(:author => 'McCaw', :body => "2", :post_id => @post.id),
                 Comment.create(:author => 'Elissalde', :body => "10", :post_id => @post.id)]
    @comment = @comments[1]
    visit post_path(@post.id)
  end

  describe "a comment in the list" do
    it "should have a delete button" do
      @comments.each{|comment| page.should have_link("Delete this Comment", :href => delete_comment_path(@post.id, comment.id), :method => 'delete')}
    end
  end

  describe "after a click on the delete link on the 2nd post" do
    it "should display the post without the comment" do
      within("li", :text => @comment.author) do
        click_on "Delete this Comment"
      end
      page.should_not have_content(@comment.author)
      page.should_not have_content(@comment.body)
    end
  end
end
