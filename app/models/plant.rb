class Plant < ApplicationRecord
  belongs_to :user

  CATEGORIES = ['Fleurs', 'Arbres fruitiers', 'Arbres']
end
