require 'spec_helper'

describe "Authentication" do
    subject { page }

    describe "Signin Page" do
        before { visit signin_path }

        it { should have_selector('h1', text: 'Sign in') }

        describe "With invalid credentials" do
            before { click_button "Sign in" }

            it { should have_selector('h1', text: 'Sign in') }
            it { should have_selector('div.alert.alert_error', text: 'Invalid') }

            describe "After visiting another page" do
                before { click_link "logo" }

                it { should_not have_selector('div.alert.alert_error', text: 'Invalid') }
            end
        end

        describe "with valid credentials" do
            let(:user) { FactoryGirl.create(:user) }
            before do
                fill_in "Email",     with: user.email.upcase
                fill_in "Password",  with: user.password
                click_button "Sign in"
            end

            it { should have_selector('title', text: user.name) }
            it { should have_link('Add post', href: new_post_path) }
            it { should have_link('Sign out', href: signout_path) }
            it { should_not have_link('Sign in', href: signin_path) }

            describe "followed by signout" do
                before { click_link 'sign-out' }
                it { should have_link('Sign in') }
            end
        end
    end
end
