require 'spec_helper'

describe "Post Pages" do
    subject { page }

    describe "With an authenticated user" do
      let(:user) { FactoryGirl.create(:user) }

      before do
          visit signin_path
          fill_in "Email",     with: user.email.upcase
          fill_in "Password",  with: user.password
          click_button "Sign in"
      end

      describe "Create New post" do
          before { visit new_post_path }

          it { should have_selector('p', text: 'Insert title:') }
          it { should have_selector('p', text: 'Insert body:') }
          it { should have_button('Save&Publish') }
          it { should have_button('Save draft') }

          describe "Save and publish content" do
              before do
                  fill_in 'post_title', with: "This is a title"
                  fill_in 'post_body', with: "This is body"
                  click_button 'Save&Publish'
              end
          end

          describe "Save as draft" do
              before do
                  fill_in 'post_title', with: "This is a title"
                  fill_in 'post_body', with: "This is body"
                  click_button 'Save draft'
              end

              it { should have_selector('p', text: 'Insert title:') }
              it { should have_selector('p', text: 'Insert body') }
              it { should have_button('Save&Publish') }
              it { should have_button('Save draft') }
          end
      end

      describe "List posts" do
          # TODO Insert Conditions
          # before { visit posts_path }

          # it { should have_selector('', text: '') }
      end

      describe "Edit post" do
          let(:post) { FactoryGirl.create(:post) }

          before { visit edit_post_path(post) }

          it { should have_selector('p', text: 'Insert title') }
          it { should have_selector('p', text: 'Insert body') }
          it { should have_button('Save&Publish') }
          it { should have_button('Save draft') }
      end

      describe "Show post" do
          # TODO Insert Conditions
          before { visit post_path }

          #it { should have_selector('h3', text: '') }
          #it { should have_selector('h3', text: '') }
      end
    end
end
