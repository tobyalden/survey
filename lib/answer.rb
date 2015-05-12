class Answer < ActiveRecord::Base
  validates(:description, :presence => true)
  belongs_to(:question)

  define_singleton_method(:get_by_question_id) do |find_question_id|
    question_answers = []
    Answer.all().each() do |answer|
      if(answer.question_id == find_question_id)
        question_answers.push(answer)
      end
    end
    return question_answers
  end

end
