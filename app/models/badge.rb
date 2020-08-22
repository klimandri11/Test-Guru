class Badge < ApplicationRecord
  RULES = %w[complete_category first_attempt complete_level].freeze

  has_many :received_badges, dependent: :destroy
  has_many :users, through: :received_badges

  validates :name, presence: true
  validates :rule, inclusion: { in: Badge::RULES }

end
