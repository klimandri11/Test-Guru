class User < ApplicationRecord

  has_many :completed_tests, dependent: :destroy
  has_many :tests, through: :completed_tests
  has_many :created_tests, inverse_of: :author, class_name: 'Test', foreign_key: 'author_id'

  validates :email, presence: true

  def passed_tests(level)
    tests.where(level: level)
  end
end
