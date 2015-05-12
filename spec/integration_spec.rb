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
