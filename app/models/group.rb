class Group < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :name, format: { with: /\A[a-zA-Z]+\z/,
                             message: 'only allows letters' }
end
