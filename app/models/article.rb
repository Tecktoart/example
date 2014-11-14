class Article < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  self.per_page = 10
end
