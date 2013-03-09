require 'spec_helper'

describe "Authentication" do
    subject { page }

    describe "Signin Page" do
        before { visit signin_path }

        it { should have_selector('h2', text: 'Sign in') }

        describe "With invalid credentials" do
            before { click_button "Sign in" }

            it { should have_selector('h1', text: 'Sign in') }
            it { should have_selector('div.alert.alert-error', text: 'Failed login') }

            describe "After visiting another page" do
                before { click_link "logo" }

                it { should_not have_selector('div.alert.alert-error', text: 'Failed login') }
            end
        end

        describe "with valid credentials" do
            let(:user) { FactoryGirl.create(:user) }
            before do
                fill_in "Email",     with: user.email.upcase
                fill_in "Password",  with: user.password
                click_button "Sign in"
            end

            it { should have_xpath("//img[@src=\"/assets/add.png\"]") }
            it { should have_xpath("//img[@src=\"/assets/show_all.png\"]") }
            it { should have_xpath("//img[@src=\"/assets/open_lock.png\"]") }
            it { should_not have_xpath("//img[@src=\"/assets/closed_lock.png\"]") }

            describe "followed by signout" do
                before { click_link "signout-link" }
                it { should have_xpath("//img[@src=\"/assets/closed_lock.png\"]") }
            end
        end
    end
end
