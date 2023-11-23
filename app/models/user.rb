class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  validates :name, format: { with: /\A[a-zA-Z]+\z/,
                             message: 'only allows letters' }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :entities
  has_many :groups
  has_one_attached :image
end
