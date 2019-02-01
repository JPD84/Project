require_relative( '../db/sql_runner' )

class Member

  attr_reader( :id)
  attr_accessor(:name, :age)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @gymclass_id = options['gymclass_id'].to_i
  end

  def save()
    sql = "INSERT INTO members (member_id, gymclass_id)
    VALUES ($1,$2) RETURNING id;"
    values = [@member_id, @gymclass_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def delete()
      sql = "DELETE FROM members WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end
