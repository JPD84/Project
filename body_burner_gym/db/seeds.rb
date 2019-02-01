require_relative( "../models/gym_session.rb" )
require_relative( "../models/member.rb" )
require_relative( "../models/booking.rb" )
require('pry')

# GymSession.delete_all()
Member.delete_all()
# Booking.delete_all()


# gymsession1 = GymSession.new({
#   "name" => "metafit",
#   "type" => "cardio"
# })
#
# gymsession1.save()
#
# gymsession2 = GymSession.new({
#   "name" => "attack",
#   "type" => "combat_cardio"
# })
#
# gymsession2.save()
#
# gymsession3 = GymSession.new({
#   "name" => "deadlift",
#   "type" => "weight_training"
# })
#
# gymsession3.save()
#
# gymsession4 = GymSession.new({
#   "name" => "circuits",
#   "type" => "cardio_and_muscle_building"
# })
#
# gymsession4.save()

member1 = Member.new({'name' => 'Arnold Strong', 'age' => '25'})
member1.save

member2 = Member.new({'name' => 'Luis Liftmore', 'age' => '27'})
member2.save

member3 = Member.new({'name' => 'Sean McGintey', 'age' => '31'})
member3.save

member4 = Member.new({'name' => 'Bobby Builder', 'age' => '29'})
member4.save

member5 = Member.new({'name' => 'Sarah McFitz', 'age' => '26'})
member5.save

member6 = Member.new({'name' => 'Ciorstidh MacPowers', 'age' => '24'})
member6.save

member7 = Member.new({'name' => 'Siobhan MacStanamally', 'age' => '21'})
member7.save

member8 = Member.new({'name' => 'Mike runnerman', 'age' => '21'})
member8.save



binding.pry
nil
