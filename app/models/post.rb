class Post < ActiveRecord::Base
  attr_accessible :title, :content, :parent_id
  validates :content, :presence => true
  has_many :comments, :class_name => "Post", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Post", :foreign_key => "parent_id"
end
