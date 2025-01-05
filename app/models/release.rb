class Release < ApplicationRecord
  belongs_to :artist
  has_many :songs, dependent: :destroy

  validates :title, presence: true
  validates :release_type, presence: true, inclusion: { in: %w[Album Single EP Compilation Mixtape Bootleg Additional],
    message: "must be one of: Album, Single, EP, Compilation, Mixtape, Bootleg, Additional" }
  validates :date_of_release, presence: true
  validates :genre, presence: true
  validates :language, presence: true
  validates :artist, presence: true

  # Метод для подсчёта общей длительности всех песен в релизе
  def total_length
    total_seconds = songs.sum(:length)
    minutes = total_seconds / 60
    seconds = total_seconds % 60
    "#{minutes}:#{format('%02d', seconds)}"
  end
end
