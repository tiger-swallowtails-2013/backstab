require 'spec_helper'



describe PostsController do
  describe "GET #index" do
    it "makes an array of posts available to the view" do
      get :index
      expect(@posts).to be_true
    end

    it "render the :index view" do
    end

  end
end

