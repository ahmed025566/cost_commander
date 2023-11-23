class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :name, presence: true
  validates :amount, presence: true
  validates :name, format: { with: /\A[a-zA-Z]+\z/,
                             message: 'only allows letters' }
  validates :amount, numericality: { only_integer: true }
end
