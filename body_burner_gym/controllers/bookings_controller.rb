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


get '/bookings/:id/edit' do
  @booking = Booking.find(params['id'])
  erb(:"bookings/edit")
end

get '/bookings/new' do
  erb(:"bookings/new")
end

get '/bookings/:id' do
  @booking = Booking.find(params['id'])
  erb(:"bookings/show")

end

post '/bookings' do
  Booking.new(params).save
  redirect to '/bookings'
end

post '/bookings' do
  Booking.new(params).save
  redirect to '/bookings'
end

post '/bookings/:id/delete' do
  gym_session = Booking.find(params['id'])
  gym_session.delete
  redirect to '/bookings'
end
