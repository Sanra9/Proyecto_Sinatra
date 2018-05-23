require 'sinatra'
require 'make_todo'

get '/' do
    @tareas=Tarea.all
  erb :index

end
get '/nueva/tarea' do
  erb :newtask
end

post '/nueva/tarea' do
  Tarea.create(params[:title])
  redirect '/'
end

get '/hechas' do
  @tareas=Tarea.all
  erb :hechas
end

post '/hechas' do
  Tarea.update(params[:id])
  redirect '/hechas'
end

post '/destroy' do
  Tarea.destroy(params[:id])
  redirect '/hechas'
end

post '/borrar' do
  Tarea.destroy(params[:id])
  redirect '/'
end
