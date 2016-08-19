class Link < ActiveRecord::Base
  # attr_accessible :link, :title, :section
  validates :title, presence: true
  validates :link, presence: true
  validates :section, presence: true
end
