class RanameAnswerTextToText < ActiveRecord::Migration[6.0]
  def change
    rename_column :answers, :answer_text, :text
  end
end
