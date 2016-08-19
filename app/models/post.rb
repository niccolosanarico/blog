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
    extend FriendlyId
    # attr_accessible :body, :title, :status, :slug, :published_at, :tags
    friendly_id :title, use: :slugged
    validates :title, presence: true
end
