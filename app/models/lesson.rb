class Lesson < ApplicationRecord
  belong_to :course
  validates :name, :description, presence: true
end
