require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/gym_session.rb' )
require_relative( '../models/member.rb' )
require_relative( '../models/booking.rb' )
also_reload( './models/*' )

get '/bookings' do
  @bookings = Booking.all()
  erb(:"bookings/index")
end

get '/bookings/new' do
  @bookings = Booking.all
  erb(:"bookings/new")
end

post '/bookings' do
  Booking.new(params).save
  redirect to '/bookings'
end
