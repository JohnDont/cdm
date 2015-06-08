class Vote < ActiveRecord::Base
  belongs_to :user, counter_cache: true
  belongs_to :song, counter_cache: true

  validates_uniqueness_of :song, scope: :user
end
