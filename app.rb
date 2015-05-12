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
  erb(:index)
end

post('/') do
  Survey.create({:name => params.fetch('survey_name')})
  @surveys = Survey.all()
  erb(:index)
end
