class User < ApplicationRecord

  def passed_tests(level)
    tests.where(level: level)
  end
end
