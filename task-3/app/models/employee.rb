# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :department

  validates :name, :department, presence: true
end
