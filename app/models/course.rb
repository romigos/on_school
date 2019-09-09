class Course < ApplicationRecord
  belongs_to :teacher

  has_many :disciplines_courses
  has_many :disciplines, through: :disciplines_courses

  has_many :lessons, dependent: :restrict_with_error
  has_many :sections, dependent: :restrict_with_error

  validates :name, presence: true
  validates :description, presence: true
  accepts_nested_attributes_for :sections, reject_if: :all_blank, allow_destroy: true
end
