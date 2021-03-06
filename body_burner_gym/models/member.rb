require_relative( '../db/sql_runner' )

class Member

  attr_reader( :id)
  attr_accessor(:name, :age)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @age = options['age'].to_i
  end

  def save()
    sql = "INSERT INTO members (name, age)
    VALUES ($1,$2) RETURNING id;"
    values = [@name, @age]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

#Write a statement that allows a member to be updated by their name and age.
#This should take in the attributes of name, age and id.
  def update()
    sql = "UPDATE members SET (name, age) = ($1, $2) WHERE id = $3"
    values = [@name, @age, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM members WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM members WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)[0]
    member = Member.new(results)
    return member
  end

  def self.all
    sql = "SELECT * FROM members"
    members = SqlRunner.run(sql)
    return members.map { |member| Member.new(member)}
  end

  def gym_sessions
    sql = "SELECT g.* FROM gym_sessions g INNER JOIN bookings b ON b.gym_session_id = g.id WHERE b.member_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |gym_session| GymSession.new(gym_session) }
  end


end
