class Article < ActiveRecord::Base
  belongs_to :user
  has_many :likes, -> { likes }, class_name: 'Vote', as: 'voteable'

  self.per_page = 10
end
