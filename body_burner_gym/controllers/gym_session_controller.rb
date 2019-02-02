require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/gym_session.rb' )
also_reload( '../models/*' )


get '/gym_sessions' do
  @gym_session = GymSession.all()
  erb ( :"gym_session/index" )
end
