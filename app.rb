require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
require('./lib/question.rb')
require('./lib/survey.rb')
require('pg')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @surveys = Survey.all()
  @message = ""
  erb(:index)
end

post('/') do
  @survey = Survey.new({:name => params.fetch('survey_name')})
  if(@survey.save())
    @message = "Created new survey."
  else
    @message = "ERROR: Survey name blank."
  end
  @surveys = Survey.all()
  erb(:index)
end
