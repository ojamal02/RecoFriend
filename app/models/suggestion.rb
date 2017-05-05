class Suggestion < ApplicationRecord
  validates :show_name, presence: true
  validates :description, presence: true

  belongs_to :user
  belongs_to :list
end
