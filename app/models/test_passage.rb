class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.passed = true if successful?
    save!
  end

  def successful?
    success_percentage >= 85
  end

  def success_percentage
    ((correct_questions.to_f / test.questions.count) * 100).round
  end

  def number_current_question
    test.questions.count - remaining_questions.count
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question
  end

  def next_question
    if current_question
      remaining_questions.first
    else
      test.questions.first
    end
  end

  def remaining_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

end
