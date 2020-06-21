module TestPassagesHelper
  def number_test(test_passage)
    "#{test_passage.number_current_question}/#{test_passage.test.questions.count}"
  end
end
