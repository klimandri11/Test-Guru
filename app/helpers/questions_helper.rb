module QuestionsHelper

  def question_header(question)
    if question.new_record?
      "Creating a new question in the test #{question.test.title}"
    else
      "Editing a question in a test #{question.test.title}"
    end
  end
end
