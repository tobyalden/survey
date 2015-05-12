require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
require('./lib/question.rb')
require('./lib/survey.rb')
require('./lib/answer.rb')
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

patch('/survey/:id') do
  survey_id = params.fetch("id").to_i
  @survey = Survey.find(survey_id)
  new_name = params.fetch('new_name').strip()
  if(new_name != "")
    @survey.update({:name => new_name})
    @message = "Updated survey name."
  else
    @message = "ERROR: Invalid survey name."
  end
  @questions = Question.get_by_survey_id(survey_id)
  erb(:survey)
end

delete('/survey/:id') do
  survey_id = params.fetch('id').to_i
  survey = Survey.find(survey_id)
  @message = "Deleted Survey: #{survey.name}"
  survey.delete
  @surveys = Survey.all()
  erb(:index)
end

get('/question/:id') do
  question_id = params.fetch("id").to_i
  @question = Question.find(question_id)
  @message = ""
  @answers = Answer.get_by_question_id(question_id)
  erb(:question)
end

post('/question/:id') do
  question_id = params.fetch("id").to_i
  @question = Question.find(question_id)
  answer = Answer.new({:description => params.fetch("answer"), :question_id => question_id})
  if(answer.save())
    @message = "Created new answer."
  else
    @message = "ERROR: Answer field blank."
  end
  @answers = Answer.get_by_question_id(question_id)
  erb(:question)
end

get('/take_survey/:id') do
  survey_id = params.fetch("id").to_i
  @survey = Survey.find(survey_id)
  erb(:take_survey)
end
