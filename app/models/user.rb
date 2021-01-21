class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :full_surname, presence: true
  validates :full_name, presence: true
  validates :half_surname, presence: true
  validates :half_name, presence: true
  validates :birthday, presence: true
end
