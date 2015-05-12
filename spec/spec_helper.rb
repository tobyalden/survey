ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|

  config.before(:each) do
    Survey.all().each() do |survey|
      survey.destroy()
    end
  end

  config.after(:each) do
    Survey.all().each() do |survey|
      survey.destroy()
    end
  end

end
