class Badge < ApplicationRecord

  has_many :received_badges, dependent: :destroy
  has_many :users, through: :received_badges

  validates :name, presence: true
  validates :rule, inclusion: { in: BadgeService::RULES }, uniqueness: { scope: :option }

end
