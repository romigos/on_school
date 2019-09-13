class Lesson < ApplicationRecord
  belongs_to :course
  has_many :tinymce_images, as: :owner

  validates :name, :description, presence: true
  acts_as_list

  def self.reorder(order_params)
    order_params.each_with_index do |id, index|
      Lesson.find(id).update!(position: index + 1)
    end
  end
end
