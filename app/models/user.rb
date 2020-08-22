class User < ApplicationRecord

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, inverse_of: :author, class_name: 'Test', foreign_key: 'author_id'
  has_many :gists, dependent: :destroy
  has_many :received_badge, dependent: :destroy
  has_many :badges, through: :received_badge

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  def passed_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    is_a?(Admin)
  end
end
