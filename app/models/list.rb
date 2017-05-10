class List < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  belongs_to :user
  has_many :suggestions

  def self.search(search)
  where("title LIKE ? OR body LIKE ?", "%#{search}%", "%#{search}%")
  end
end
