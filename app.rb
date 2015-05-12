require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
require('./lib/question.rb')
require('./lib/survey.rb')
require('pg')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end
