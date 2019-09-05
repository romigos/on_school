class Course < ApplicationRecord
  validates :name, presence: true

  belongs_to :teacher
  has_many :discipline_courses
  has_many :disciplines, through: :discipline_courses
  has_many :lessons

  validates :name, :discription, presence: true
end
