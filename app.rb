require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  @dictionary = Word.all()
  erb(:index)
end

get("/word/new")do
  erb(:word_form)
end

post("/word") do
  new_word = Word.new({:word => params.fetch('word')})
  new_definition = Definition.new({:text => params.fetch('definition')})
  new_word.add_definition(new_definition)
  new_word.save()
  @dictionary = Word.all()
  erb(:index)
end

get("/definitions/:id") do
  @word = Word.find(params.fetch('id').to_i())
  erb(:definitions)
end

get ("/definition/:id/new") do
  @word = Word.find(params.fetch('id').to_i())
  erb(:definition_form)
end

post("/definition/:id") do
  my_word = Word.find(params.fetch('id').to_i())
  new_definition = Definition.new({:text => params.fetch('definition')})
  my_word.add_definition(new_definition)
  @word = my_word
  erb(:definitions)
end
