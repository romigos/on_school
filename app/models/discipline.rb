class Discipline < ApplicationRecord
  validates :name, presence: true
  has_many :courses
  has_many :teachers, :through => :courses
end
