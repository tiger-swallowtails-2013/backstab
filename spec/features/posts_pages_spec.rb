require 'spec_helper'

DatabaseCleaner.strategy = :transaction
describe "feature" do
  # before :each do
  DatabaseCleaner.start
  # end

  # after :each do
  # end

  describe "index" do

    it "display the post after adding it" do
      expect {
        visit root_path
        fill_form
        click_button "Submit"
        }.to change(Post,:count).by(1)
        page.should have_content "Title"
      end

      it "takes you to show post content after clicking it" do
        post = FactoryGirl.create(:post, title: "Post title", content: "Post content")
        visit root_path
        click_link "Post title"
        page.should have_content "Post content"
      end

    end

    describe "edit" do
      let(:post) {FactoryGirl.create(:post)}
      before :each do
        visit edit_post_path(post)
      end
      it "displays edit page on visit" do
        page.has_text?(post.title)
        page.has_text?(post.content)
      end

      it "updates post on submit" do
        fill_in 'post_title', with: "New title"
        click_button "Submit"
        expect(page).to have_content("New title")
      end

    end

    describe "delete" do
      let!(:post) {FactoryGirl.create(:post)}
      it "deletes the current post" do
        expect {
          visit post_path(post)
          click_link "Delete"
          }.to change(Post,:count).by(-1)
        end
      end

      describe "posting comments" do
        it "should display comment on post page" do
          post =  FactoryGirl.create(:post)
          visit post_path(post)
          fill_in "post_content", with: "child content"
          click_button "Submit"
          page.should have_content("child content")
        end
      end

      DatabaseCleaner.clean
    end
