require 'spec_helper'

describe "Post Pages" do
  subject { page }
  
  describe "New post" do
    before { visit new_post_path }

    it { should have_selector('h1', text: 'Title') }
    
  end
end
