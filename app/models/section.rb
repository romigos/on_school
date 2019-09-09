class Section < ApplicationRecord
  belongs_to :course
  has_many :lessons, dependent: :restrict_with_error
  validates :name, :description, presence: true
  validates :course_id, presence: true
  acts_as_list
end
