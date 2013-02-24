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

class Post < ActiveRecord::Base
  attr_accessible :body, :title, :status

  validates :title, presence: true
end
