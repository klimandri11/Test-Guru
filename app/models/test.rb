class Test < ApplicationRecord
  def self.tests_titels(category)
    Test.joins(:categories).where(:categories { title: category }).order(title: :desc).select(:title)
  end
end
