require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/gym_session.rb' )
require_relative( '../models/member.rb' )
require_relative( '../models/booking.rb' )
also_reload( '../models/*' )

get '/' do
  erb(:index)
end
