class User < ApplicationRecord
  has_many :rooms, through: :room_users
  has_many :room_users, dependent: :destroy
  has_many :comments, through: :room_users
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
