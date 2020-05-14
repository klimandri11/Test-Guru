class AddQuestionsQuestionsTextNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:questions, :question_text, false)
  end
end
