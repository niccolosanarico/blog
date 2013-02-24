require 'spec_helper'

describe "Post Pages" do
    subject { page }

    describe "Create New post" do
        before { visit new_post_path }

        it { should have_selector('p', text: 'Insert title:') }
        it { should have_selector('p', text: 'Insert body:') }
        it { should have_button('Save&Publish') }
        it { should have_button('Save draft') }

        describe "Save and publish content" do
            before do 
                fill_in 'title', "This is a title"
                fill_in 'body', "This is body"
                click_button 'Save&Publish'
            end

            it { shoud have_selector('p', text: 'Thank you for posting a new entry') }
        end

        describe "Save as draft" do
            before do 
                fill_in 'title', "This is a title"
                fill_in 'body', "This is body"
                click_button 'Save draft'
            end

            it { shoud have_selector('p', text: 'Insert title:') }
            it { shoud have_selector('p', text: 'Insert body') }
            it { should have_button('Save&Publish') }
            it { should have_button('Save draft') }
        end
    end

    describe "List posts" do
        # TODO Insert Conditions
        before { visit posts_path }

        it { should have_selector('', text: '') }
    end 

    describe "Edit post" do
        before { visit edit_post_path }

        it { should have_selector('h3', text: 'Edit Title') }
        it { should have_selector('h3', text: 'Edit Body') }
    end

    describe "Show post" do
        # TODO Insert Conditions
        before { visit post_path }

        it { should have_selector('h3', text: '') }
        it { should have_selector('h3', text: '') }
    end
end
