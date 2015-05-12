require('spec_helper')

describe(Question) do
  it("validates the presence of characters in the form") do
    question = Question.new({:description => ""})
    expect(question.save()).to(eq(false))
  end

  describe(:get_by_survey_id) do
    it("returns the questions associated with a specified survey") do
      survey = Survey.create({:name => "100 Questions about Doug"})
      question = Question.create({:description => "Does Doug ever think about me?", :survey_id => survey.id()})
      expect(Question.get_by_survey_id(survey.id)).to(eq([question]))
    end
  end

end
