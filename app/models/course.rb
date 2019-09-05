class Course < ApplicationRecord
  belongs_to :teacher
  belongs_to :discipline

  has_many :lessons

  validates :name, presence: true
  validates :description, presence: true
end
