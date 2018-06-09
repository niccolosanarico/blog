class Link < ActiveRecord::Base
  # attr_accessible :link, :title, :section
  validates :title, presence: true
  validates :link, presence: true
  validates :section, presence: true

  # before_validation do
  #   self.link = ApplicationController.helpers.shorten_url_coinhive(self.link)
  # end
end
