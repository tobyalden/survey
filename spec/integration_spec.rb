require('capybara/rspec')
require('./app')
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe("The path to the index page", {:type => :feature}) do
  it("displays a header and a list of surveys.") do
    visit('/')
    expect(page).to(have_content("Surveys:"))
  end
end

describe("The path to add a survey", {:type => :feature}) do
  it("displays a form which adds a new survey to the list when submitted.") do
    visit('/')
    fill_in('survey_name', :with => "Should Doug be executed?")
    click_button("submit")
    expect(page).to(have_content("Should Doug be executed?"))
  end
end

describe("The path to an individual survey's page", {:type => :feature}) do
  it("displays a list of surveys, each of which is a link to its individual page.") do
    test_survey = Survey.create({:name => "Should Tim apologize to Doug's wife for executing him?"})
    visit('/')
    click_link(test_survey.id)
    expect(page).to(have_content("Should Tim apologize to Doug's wife for executing him?"))
    expect(page).to(have_content("Questions:"))
  end
end

describe("The path to add a question to a survey", {:type => :feature}) do
  it("displays a form on an individual survey's page to add a question to that survey.") do
    test_survey = Survey.create({:name => "Should Tim apologize to Doug's wife for executing him?"})
    visit('/')
    click_link(test_survey.id)
    fill_in("question", :with => "How much do you like Tim on a scale of 1 to 10?")
    click_button("submit")
    expect(page).to(have_content("How much do you like Tim on a scale of 1 to 10?"))
  end
end
