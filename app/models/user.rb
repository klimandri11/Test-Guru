class User < ApplicationRecord

  def passed_tests(level)
    Test.joins('JOIN completed_tests ON completed_tests.test_id = tests.id').where(completed_tests: { user_id: id }, level: level)
  end
end
