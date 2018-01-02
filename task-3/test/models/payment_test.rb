# frozen_string_literal: true

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  def customer1
    customers(:bob)
  end

  def customer2
    customers(:alice)
  end

  test 'cant have same check number within one customer' do
    attributes = {
      amount: 1_000.01,
      check_number: '123'
    }

    assert_predicate customer1.payments.create(attributes), :valid?

    payment = customer1.payments.create(attributes)
    refute_predicate payment, :valid?
    assert_equal 1, payment.errors.count
    refute_nil payment.errors[:check_number]
  end

  test 'can repeat when check_number is nil' do
    attributes = {
      amount: 1_000.01,
      check_number: nil
    }

    3.times do
      assert_predicate customer1.payments.create(attributes), :valid?
    end
  end

  test 'can repeat same non-nil check_number within two customers' do
    attributes = {
      amount: 1_000.01,
      check_number: '123'
    }

    assert_predicate customer1.payments.create(attributes), :valid?
    assert_predicate customer2.payments.create(attributes), :valid?
  end
end
