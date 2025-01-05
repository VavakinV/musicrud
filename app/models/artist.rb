class Artist < ApplicationRecord
    validates :name, presence: true
    has_many :releases, dependent: :destroy
end
