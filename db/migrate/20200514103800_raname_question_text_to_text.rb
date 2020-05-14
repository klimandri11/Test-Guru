class RanameQuestionTextToText < ActiveRecord::Migration[6.0]
  def change
    rename_column :questions, :question_text, :text
  end
end
