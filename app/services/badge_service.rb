class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
  end

  def call
    Badge.all.select do |badge|
      send(badge.rule)
    end
  end

  def first_attempt
    if @test_passage.successful?
      @user.tests.where(title: @test.title).count == 1
    end
  end

  def complete_level
    if @test_passage.successful?
      @user.passed_tests(@test.level).uniq.count == Test.where(level: @test.level).count
    end
  end

  def complete_category
    if @test_passage.successful?
      @user.tests.where(category_id: @test.category.id).uniq.count == Test.where(category_id: @test.category.id).count
    end
  end
end
