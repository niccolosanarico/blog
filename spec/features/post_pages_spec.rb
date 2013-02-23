require 'spec_helper'

describe "Post Pages" do
    subject { page }

    describe "Visit New post" do
        before { visit new_post_path }

        it { should have_selector('h3', text: 'Insert Title') }
        it { should have_selector('h3', text: 'Insert Body') }
    end

    describe "List posts" do
        # TODO Insert Conditions
        before { visit all_posts_path }

        it { should have_selector('', text: '') }
    end 

    describe "Edit post" do
        before { visit edit_post_path }

        it { should have_selector('h3', text: 'Edit Title') }
        it { should have_selector('h3', text: 'Edit Body') }
    end
    
    describe "Show post" do
        # TODO Insert Conditions
        before { visit show_post_path }

        it { should have_selector('h3', text: '') }
        it { should have_selector('h3', text: '') }
    end
end
