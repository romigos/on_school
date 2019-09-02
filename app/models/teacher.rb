# frozen_string_literal: true

class Teacher < ApplicationRecord
  validates :first_name, :last_name, :description, presence: true
  has_many :courses
  has_many :disciplines
end
