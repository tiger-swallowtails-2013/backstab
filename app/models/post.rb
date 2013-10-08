class Post < ActiveRecord::Base
  attr_accessible :title, :content
  has_many :comments, :class_name => "Post", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Post", :foreign_key => "parent_id"
end