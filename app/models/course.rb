class Course < ApplicationRecord
  belongs_to :teacher
  belongs_to :discipline

  has_many :lessons
  has_many :sections
  validates :name, presence: true
  validates :description, presence: true
  accepts_nested_attributes_for :sections, reject_if: :all_blank, allow_destroy: true
end
