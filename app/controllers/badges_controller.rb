class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @badges = Badge.all
    @received_badges = current_user.badges
  end
end
