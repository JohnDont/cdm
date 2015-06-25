class Category < ActiveRecord::Base
  has_many :songs, dependent: :nullify

  validates :name, presence: true
end
