class Category < ActiveRecord::Base
  extend FriendlyId

  has_many :songs, dependent: :nullify

  validates :name, presence: true

  friendly_id :name, use: :slugged

  enum parent: [ :electronic_music, :cdm, :caribbean_music, :other ]

  def self.group_parents
    groups = []
    Category.parents.keys.each do |parent|
      groups << [ parent.humanize.upcase, Category.send(parent).order('name asc').map { |c| [c.name, c.id]}]
    end
    groups
  end
end
