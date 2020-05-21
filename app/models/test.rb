class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: true
  has_many :questions, dependent: :destroy
  has_many :completed_tests, dependent: :destroy
  has_many :users, through: :completed_tests

  def self.tests_titels(category)
    Test.joins(:categories)
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
