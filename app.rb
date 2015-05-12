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

get('/survey/:id') do
  survey_id = params.fetch("id").to_i
  @survey = Survey.find(survey_id)
  @message = ""
  @questions = Question.get_by_survey_id(survey_id)
  erb(:survey)
end

post('/survey/:id') do
  survey_id = params.fetch("id").to_i
  @survey = Survey.find(survey_id)
  question = Question.new({:description => params.fetch("question"), :survey_id => survey_id})
  if(question.save())
    @message = "Created new question."
  else
    @message = "ERROR: Question field blank."
  end
  @questions = Question.get_by_survey_id(survey_id)
  erb(:survey)
end
