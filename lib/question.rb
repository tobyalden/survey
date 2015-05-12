class Question < ActiveRecord::Base
  validates(:description, :presence => true)
  belongs_to(:survey)

  define_singleton_method(:get_by_survey_id) do |find_survey_id|
    survey_questions = []
    Question.all().each() do |question|
      if(question.survey_id == find_survey_id)
        survey_questions.push(question)
      end
    end
    return survey_questions
  end

end
