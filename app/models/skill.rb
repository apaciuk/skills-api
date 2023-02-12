class Skill < ApplicationRecord
  belongs_to :user, optional: true, class_name: 'User', foreign_key: 'user_id'
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
end
