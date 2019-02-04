require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/gym_session.rb' )
also_reload( '../models/*' )


get '/gym_sessions' do
  @gym_sessions = GymSession.all()
  erb ( :"gym_sessions/index" )
end

get '/gym_sessions/new' do
  erb(:"gym_sessions/new")
end

get '/gym_sessions/:id' do
  @gym_session = GymSession.find(params['id'])
  erb(:"gym_sessions/show")
end

get '/gym_sessions/:id/edit' do
  @gym_session = GymSession.find(params['id'])
  erb(:"gym_sessions/edit")
end

post '/gym_sessions/:id' do
  gym_session = GymSession.new(params)
  gym_session.update
  redirect to "/gym_sessions"
end

post '/gym_sessions/:id/delete' do
  gym_session = GymSession.find(params['id'])
  gym_session.delete
  redirect to '/gym_sessions'
end
