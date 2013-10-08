require 'spec_helper'



describe PostsController do

  let!(:parent_post) {FactoryGirl.create(:post)}
  describe "GET #index" do
    it "makes an array of posts available to the view" do
      get :index
      assigns(:posts).should_not be_nil
    end
  end

  describe "DELETE #destroy" do
    it "should destroy the post with the id that has been passed" do
      expect {
        delete :destroy, id: parent_post
        }.to change(Post,:count).by(-1)
      end

    it "should redirect to root_path" do
        delete :destroy, id: parent_post
        expect(response).to redirect_to root_path
    end
  end

  describe "POST #create" do
    context "create parent post" do
      it "should create a parent post when parent_id is zero" do
        expect {
          post :create, post: FactoryGirl.attributes_for(:post)
          }.to change(Post,:count).by(1)
      end

      it "should redirect to root_path" do
        post :create, post: FactoryGirl.attributes_for(:post)
        expect(response).to redirect_to root_path
      end
    end

    context "create child comment" do
      it "should create a child post when parent_id is set" do
        expect {
          post :create, post: FactoryGirl.attributes_for(:comment)
        }.to change(Post.first.comments,:count).by(1)
      end

      it "should redirect to post_path" do
        post :create, post: FactoryGirl.attributes_for(:comment)
        expect(response).to redirect_to post_path(parent_post)
      end
    end 
  end

  describe "PUT #update" do
    it "should update the post with the params passed" do
      put :update, id: parent_post, post: FactoryGirl.attributes_for(:post, title: "Title", content: "Content") 
      parent_post.reload
      expect(parent_post.title).to eq("Title")
      expect(parent_post.content).to eq("Content")
    end
    it "should redirect_to the post_path" do
      put :update, id: parent_post, post: FactoryGirl.attributes_for(:post) 
      response.should redirect_to post_path(parent_post)
    end
  end
end

