class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :name, presence: true
  validates :amount, presence: true

  validates :amount, numericality: { only_integer: true }
end
