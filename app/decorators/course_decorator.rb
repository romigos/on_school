class CourseDecorator < ApplicationDecorator
  delegate_all

  def disciplines_names
    disciplines_names.map(&:name).join(',')
  end
end
