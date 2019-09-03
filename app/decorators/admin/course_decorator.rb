# frozen_string_literal: true

class Admin::CourseDecorator < ApplicationDecorator
  delegate_all

  def disciplines_names
    discipline_names.map(&:name).join(',')
  end
end
