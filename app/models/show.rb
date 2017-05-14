class Show < ApplicationRecord
  validates :title, presence: true

  belongs_to :user, optional: true
end
