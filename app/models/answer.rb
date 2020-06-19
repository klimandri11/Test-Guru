class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validate :max_answers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def max_answers
    errors.add(:base) if question.answers.count >= 4
  end
end
