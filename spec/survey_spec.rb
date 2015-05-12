require('spec_helper')

describe(Survey) do
  it("validates the presence of characters in the form") do
    survey = Survey.new({:name => ""})
    expect(survey.save()).to(eq(false))
  end
end
