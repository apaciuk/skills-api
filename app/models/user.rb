class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :trackable, :api

  has_many :goals, dependent: :destroy, class_name: 'Goal', foreign_key: 'user_id'
  has_many :skills, dependent: :destroy, class_name: 'Skill', foreign_key: 'user_id'
  has_many :train_dates, -> { distinct }, dependent: :destroy, class_name: 'TrainDate', foreign_key: 'user_id'
end
