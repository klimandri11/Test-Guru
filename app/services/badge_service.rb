class BadgeService
  RULES = %w[complete_category first_attempt complete_level].freeze

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
  end

  def call
    Badge.all.select do |badge|
      send("#{badge.rule}", badge)
    end
  end

  def first_attempt(badge)
    return unless @test_passage.successful?
    completed_test_passages.where(tests: { title: @test.title }).count == 1
  end

  def complete_level(badge)
    return unless @test.level == badge.option.to_i && @test_passage.successful?
    level = badge.option
    tests_level = Test.where(level: level.to_i).count
    tests_complited = @user.tests.successful_passage.where(level: level)
    if were_badges_issued?(badge)
      tests_level == tests_complited.after_badge_issue(award_date(badge)).uniq.count
    else
      tests_level == tests_complited.uniq.count
    end
  end

  def complete_category(badge)
    return unless @test.category.title == badge.option && @test_passage.successful?
    category = badge.option
    tests_category = Test.tests_titels(category).count
    tests_complited = @user.tests.successful_passage.tests_titels(category)
    if were_badges_issued?(badge)
      tests_category == tests_complited.after_badge_issue(award_date(badge)).uniq.count
    else
      tests_category == tests_complited.uniq.count
    end
  end

  private

  def completed_test_passages
    @user.test_passages.joins(:test).where(passed: true)
  end

  def award_date(badge)
    @user.received_badge.where(badge: badge).order(created_at: :asc).last.created_at
  end

  def were_badges_issued?(badge)
    @user.received_badge.where(badge: badge).exists?
  end

end
