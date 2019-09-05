# frozen_string_literal: true

class Teacher < ApplicationRecord
  has_many :courses
  has_many :disciplines, :through => :courses

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
end
