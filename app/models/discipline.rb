class Discipline < ApplicationRecord
  has_many :courses
  has_many :teachers, :through => :courses

  validates :name, presence: true
end
