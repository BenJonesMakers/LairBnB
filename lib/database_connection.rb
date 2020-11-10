require 'pg'

class DatabaseConnection

  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.query(sql)
    @connection.exec(sql)
  end

  def self.all
    @connection.exec("SELECT * FROM spaces;")
  end
end
