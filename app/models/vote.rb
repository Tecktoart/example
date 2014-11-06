class Vote < ActiveRecord::Base
  belongs_to :article, polymorphic: true

  scope :likes, -> { where(score: 1) }

  validates_uniqueness_of :voteable_id, :scope => [:user_id, :score, :voteable_type]
end