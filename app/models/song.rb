class Song < ApplicationRecord
  belongs_to :release

  validates :title, presence: true
  validates :length, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :order_in_release, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :release, presence: true

  # Метод для получения длины в формате MM:SS
  def formatted_length
    minutes = length / 60
    seconds = length % 60
    "#{minutes}:#{format('%02d', seconds)}"
  end
end
