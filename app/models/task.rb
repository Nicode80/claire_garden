class Task < ApplicationRecord
  belongs_to :plant

  PERIODICITES = ['Mensuel', 'Trimestriel', 'Semestriel', 'Annuel', 'Bisannuel', 'Trisannuel']

  has_one_attached :photo
end
