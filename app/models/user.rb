class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]+\z/i

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, inverse_of: :author, class_name: 'Test', foreign_key: 'author_id'

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX }

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
