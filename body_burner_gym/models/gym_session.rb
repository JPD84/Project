require_relative( '../db/sql_runner' )

class GymSession

  attr_reader( :id)
  attr_accessor(:name, :type)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
  end

  def save()
    sql = "INSERT INTO gym_sessions (name, type)
    VALUES ($1,$2) RETURNING id;"
    values = [@name, @type]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE gym_session SET (name, type) = ($1, $2) WHERE id = $3"
    values = [@name, @type, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM gym_sessions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM gym_sessions"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM gym_sessions WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)[0]
    gym_sessions = GymSession.new(results)
    return gym_session
  end

  def self.all
    sql = "SELECT * FROM gym_sessions"
    gym_sessions = SqlRunner.run(sql)
    return gym_sessions.map { |gym_session| gym_session.new(gym_session)}
  end

  def members()
    sql = "SELECT m.* FROM members m INNER JOIN bookings b ON b.member_id = m.id WHERE b.gym_session_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |member| Member.new(member) }
  end
end


  # def victims
  #     sql = "SELECT v.* FROM victims v INNER JOIN bitings b ON b.victim_id = v.id WHERE b.zombie_id = $1;"
  #     values = [@id]
  #     results = SqlRunner.run(sql, values)
  #     return results.map { |victim| Victim.new(victim) }
