class Task < ApplicationRecord
  belongs_to :plant

  PERIODICITES = ['Mensuel', 'Trimestriel', 'Semestriel', 'Annuel', 'Bisannuel', 'Trisannuel']

  has_one_attached :photo

  def season
    start_month = self.start_date.month
    end_month = self.end_date.month
    case mean_month(start_month, end_month)
    when 1..3
      "Hiver"
    when 4..6
      "Printemps"
    when 7..9
      "Eté"
    when 9..12
      "Automne"
    end
  end

  private

  def mean_month(start_month, end_month)
    if start_month <= end_month
      (start_month + end_month) / 2
    elsif start_month > end_month && (start_month + end_month) > 12
      start_month + end_month - 12
    else
      start_month + end_month
    end
  end
end
