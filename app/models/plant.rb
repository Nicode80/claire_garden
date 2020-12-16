class Plant < ApplicationRecord
  belongs_to :user

  CATEGORIES = ['Fleurs', 'Arbres fruitiers', 'Arbres']

  has_one_attached :photo
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
end
