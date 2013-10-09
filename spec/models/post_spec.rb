require 'spec_helper'
require 'faker'



describe Post do

  let(:post) {FactoryGirl.create(:post)}
  context "validations" do
    it "should be valid with title and content present" do
      post.should be_valid
    end

    it "should not be valid without any content" do
      FactoryGirl.build(:post, content: nil).should_not be_valid
    end

    it {should validate_presence_of(:content)}
  end

context "associations" do
  it { should have_many(:comments) }
  it { should belong_to(:parent)}
  it {should belong_to(:user)}
end

end
