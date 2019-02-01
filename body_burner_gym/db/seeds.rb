require_relative( "../models/gym_class.rb" )
require_relative( "../models/member.rb" )
require_relative( "../models/booking.rb" )
require('pry')

GymClass.delete_all()
Member.delete_all()
Booking.delete_all()


gymclass1 = GymClass.new({
  "name" => "metafit",
  "type" => "cardio"
})

gymclass1.save()

gymclass2 = GymClass.new({
  "name" => "attack",
  "type" => "combat_cardio"
})

gymclass2.save()

gymclass3 = GymClass.new({
  "name" => "deadlift",
  "type" => "weight_training"
})

gymclass3.save()

gymclass4 = GymClass.new({
  "name" => "circuits",
  "type" => "cardio_and_muscle_building"
})

gymclass4.save()

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

booking1 = Booking.new({'member_id' => member1.id, 'gymclass_id' => gymclass1.id})
booking1.save

booking2 = Booking.new({'member_id' => member2.id, 'gymclass_id' => gymclass2.id})
booking2.save

booking3 = Booking.new({'member_id' => member3.id, 'gymclass_id' => gymclass3.id})
booking3.save

booking4 = Booking.new({'member_id' => member4.id, 'gymclass_id' => gymclass4.id})
booking4.save

booking5 = Booking.new({'member_id' => member5.id, 'gymclass_id' => gymclass5.id})
booking5.save

booking6 = Booking.new({'member_id' => member6.id, 'gymclass_id' => gymclass6.id})
booking6.save

booking7 = Booking.new({'member_id' => member7.id, 'gymclass_id' => gymclass7.id})
booking7.save

booking8 = Booking.new({'member_id' => member8.id, 'gymclass_id' => gymclass8.id})
booking8.save
