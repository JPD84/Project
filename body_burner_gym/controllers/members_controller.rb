get '/members' do
  @members = Member.all()
  erb(:"member/index")
end
