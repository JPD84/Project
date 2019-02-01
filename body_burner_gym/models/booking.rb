require_relative( '../db/sql_runner' )

class Booking

  attr_reader( :id)
  attr_accessor(:member_id, :gym_session_id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @gym_session_id = options['gym_session_id'].to_i
  end

  def save()
    sql = "INSERT INTO bookings (member_id, gym_session_id )
    VALUES ($1,$2) RETURNING id;"
    values = [@member_id, @gym_session_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE bookings SET (member_id, gym_session_id) = ($1, $2) WHERE id = $3"
    values = [@member_id, @gym_session_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM bookings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM bookings"
    bookings = SqlRunner.run(sql)
  end

  def gym_session()
    sql = "SELECT * FROM gym_sessions
    WHERE id = $1"
    values = [@gym_session_id]
    results = SqlRunner.run( sql, values )
    return GymSession.new( results.first )
  end

  def member()
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [@member_id]
    results = SqlRunner.run( sql, values )
    return Member.new( results.first )
  end

  def self.find(id)
    sql = "SELECT * FROM bookings WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)[0]
    booking = Booking.new(results)
    return booking
  end

  def self.all
    sql = "SELECT * FROM bookings"
    bookings = SqlRunner.run(sql)
    return bookings.map { |booking| booking.new(booking)}
  end
end
