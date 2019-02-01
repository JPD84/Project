require_relative( '../db/sql_runner' )

class Member

  attr_reader( :id)
  attr_accessor(:name, :age)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name'].to_i
    @age = options['age'].to_i
  end

  def save()
    sql = "INSERT INTO members (name, age)
    VALUES ($1,$2) RETURNING id;"
    values = [@name, @age]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE members SET () = ($1, $2,) WHERE id = $"
    values = [@, , @age, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM members WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM members"
    customers = SqlRunner.run(sql)
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
    return customers.map { |members| Member.new(member)}
  end
