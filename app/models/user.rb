class User < ApplicationRecord

  has_many :completed_tests
  has_many :tests, through: :completed_tests
  has_many :created_tests, inverse_of: :author, class_name: 'Test', foreign_key: 'author_id'

  def passed_tests(level)
    Test.where(level: level)
  end
end
