class Plant < ApplicationRecord
  belongs_to :user

  CATEGORIES = ['Fleurs', 'Arbres fruitiers', 'Arbres']

  has_one_attached :photo
end
