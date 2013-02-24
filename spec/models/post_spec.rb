# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string(255)
#

require 'spec_helper'

describe Post do
    before { @post = Post.new( title: "A new blog post", body: "this is the body" ) }

    subject { @post }

    it { should respond_to(:title) }
    it { should respond_to(:body) }
end
