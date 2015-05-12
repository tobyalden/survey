require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe("The path to the index page", {:type => :feature}) do
  it("displays a header and a list of surveys.") do
    visit('/')
    expect(page).to(have_content("Surveys:"))
  end
end
