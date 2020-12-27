class Plant < ApplicationRecord
  belongs_to :user

  CATEGORIES = ['Tous', 'Fleurs', 'Plantes Vertes', 'Arbres fruitiers', 'Arbres']

  has_one_attached :photo
  has_many :tasks, dependent: :destroy

  validates :name, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [:name],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
