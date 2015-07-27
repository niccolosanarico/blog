# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  link       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Link do
    before { @link = Link.new( title: "Dave McClure's How to Pitch", link: "http://www.google.com", section: "How to pitch" ) }

    subject { @link }

    it { should respond_to(:title) }
    it { should respond_to(:link) }
    it { should respond_to(:section) }
    it { should be_valid }
end
