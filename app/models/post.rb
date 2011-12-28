class Post < ActiveRecord::Base
    has_many :comments, :dependent => :destroy
    belongs_to :user
    
    validates_presence_of :title, :body
    validates_length_of :title, :maximum => 25
    validates_length_of :body, :maximum => 450
    
    validates_uniqueness_of :title
end
