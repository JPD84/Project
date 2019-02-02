require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/gym_session.rb' )
also_reload( '../models/*' )


get '/gym_sessions' do
  @gym_sessions = GymSession.all()
  erb ( :"gym_session/index" )
end

get '/gym_sessions/new' do
  @gym_sessions = GymSession.all
  erb(:new)
end

get '/gym_sessions/:id/edit' do
  @gym_sessions = GymSession.all
  @gym_sessions = GymSession.find(params['id'])
  erb(:edit)
end

post '/gym_sessions/:id' do
  gym_session = Member.new(params)
  gym_session.update
  redirect to "/gym_sessions /#{params['id']}"
end

post '/gym_sessions/:id/delete' do
  gym_session = GymSession.find(params['id'])
  gym_session.delete
  redirect to '/gym_sessions'
end
