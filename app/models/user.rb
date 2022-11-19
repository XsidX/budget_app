class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :categories, dependent: :destroy
  has_many :transaction_entities, dependent: :destroy
  has_one_attached :avatar

  validates :name, presence: true, length: { maximum: 30 }
end
