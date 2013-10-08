require 'spec_helper'
require 'faker'

FactoryGirl.define do
  factory :post do |f|
    f.title {Faker::Lorem.sentence(word_count=5)}
    f.content {Faker::Lorem.paragraph(paragraph_count=1)}
    f.parent_id nil
  end
end

describe Post do

    let(:post) {FactoryGirl.build(:post)}

  it "should be valid with title and content present" do
    post.should be_valid
  end

  it "should not be valid without any content" do
    FactoryGirl.build(:post, content: nil).should_not be_valid
  end
end
