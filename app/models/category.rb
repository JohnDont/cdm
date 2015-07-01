class Category < ActiveRecord::Base
  extend FriendlyId

  has_many :songs, dependent: :nullify

  validates :name, presence: true

  friendly_id :name, use: :slugged

  enum parent: [ :electronic_music, :cdm, :caribbean_music, :other ]
end
