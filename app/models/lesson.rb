class Lesson < ApplicationRecord
  belongs_to :course
  validates :name, :description, presence: true
  acts_as_list
end
