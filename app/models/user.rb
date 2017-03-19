class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         :lockable

  validates :first_name, presence: true
  validates :last_name, presence: true
end
