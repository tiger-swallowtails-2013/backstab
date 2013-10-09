require 'spec_helper'
require 'faker'

describe User do
  let(:user) {FactoryGirl.create(:post)}
  context "validations" do
    it "should validate with presence of username and password" do
      user.should be_valid
    end

    it {should validate_uniqueness_of(:username)}
  end

  context "associations" do
    it {should have_many(:posts)}
  end
end
