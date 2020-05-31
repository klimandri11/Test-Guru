class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: true
  has_many :questions, dependent: :destroy
  has_many :completed_tests, dependent: :destroy
  has_many :users, through: :completed_tests

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :tests_titels, -> (category) { joins(:category)
                                       .where(categories: { title: category })
                                       .order(title: :desc)
                                      }

  def self.tests_titels_array_name(category)
    tests_titels.pluck(:title)
  end
end
