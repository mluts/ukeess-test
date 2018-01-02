# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :customer

  validates :customer, :amount, presence: true

  validates :check_number, uniqueness: {
    scope: :customer,
    message: :cant_repeat_within_same_customer,
    if: 'check_number.present?'
  }
end
