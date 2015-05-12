require('spec_helper')

describe(Survey) do
  it("validates the presence of characters in the form") do
    survey = Survey.new({:name => ""})
    expect(survey.save()).to(eq(false))
  end

  it("ensures the first letter is capitalized") do
    survey = Survey.create({:name => "should?"})
    expect(survey.name()).to(eq("Should?"))
  end
end
