class Course < ApplicationRecord
  validates :name, presence: true

  belongs_to :teacher
  belongs_to :discipline
end
