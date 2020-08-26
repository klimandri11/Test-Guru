module ApplicationHelper

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def rules_collection
    BadgeService::RULES.map { |rule| [t("badge_rules.#{rule}"), rule] }
  end

end
