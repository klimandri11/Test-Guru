class Test < ApplicationRecord

  belongs_to :category
  has_many :questions
  has_many :completed_tests
  has_many :users, through: :completed_tests
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: true

  def self.tests_titels(category)
    Test.joins(:categories)
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
