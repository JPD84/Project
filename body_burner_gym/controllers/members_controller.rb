require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )


get '/members' do
  @members = Member.all()
  erb(:"member/index")
end

get '/members/new' do
  @members = Member.all
  erb(:new)
end

post '/members' do
  Member.new(params).save
  redirect to '/members'
end

get '/members/:id' do
  @members = Member.find(params['id'])
  erb(:show)
end

get '/members/:id/edit' do
  @members = Member.all
  @members = Member.find(params['id'])
  erb(:edit)
end

post '/members/:id' do
  member = Member.new(params)
  member.update
  redirect to "/members/#{params['id']}"
end

post '/members/:id/delete' do
  member = Member.find(params['id'])
  member.delete
  redirect to '/members'
end
