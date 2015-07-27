require 'spec_helper'

describe "Link Pages" do
    subject { page }

    describe "With an authenticated user" do
      let(:user) { FactoryGirl.create(:user) }

      before do
          visit signin_path
          fill_in "Email",     with: user.email.upcase
          fill_in "Password",  with: user.password
          click_button "Sign in"
      end

      describe "Create New link" do
          before { visit new_link_path }

          it { should have_selector('p', text: 'Insert title:') }
          it { should have_selector('p', text: 'Insert link:') }
          it { should have_button('Save') }
      end

      describe "List posts" do
          let(:link) { FactoryGirl.create(:link) }

          before do
            visit new_link_path
            fill_in "link_title", with: link.title
            fill_in "link_link", with: link.link
            click_button('Save')

            visit links_path
          end

          it { should have_link(link.title, link.link) }
      end

      describe "Edit link" do
          let(:link) { FactoryGirl.create(:link) }

          before { visit edit_link_path(link) }

          it { should have_selector('p', text: 'Insert title') }
          it { should have_selector('p', text: 'Insert link') }
          it { should have_button('Save') }
          it { should have_button('Delete') }
      end
    end
end
