class Lesson < ApplicationRecord
  belongs_to :course
  validates :name, :description, presence: true
  acts_as_list

  def self.reorder(params)
    params[:lesson].each_with_index do |id, index|
      Lesson.find(id).update!(position: index + 1)
    end
  end
end
