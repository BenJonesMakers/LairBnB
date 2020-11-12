require 'pg'
require 'bcrypt'

def setup_test_database
  connection = PG.connect(dbname: 'lairbnb_test')
  connection.exec("TRUNCATE spaces;")
  connection.exec("TRUNCATE users;")

end

def add_row_to_test_database
  connection = PG.connect(dbname: 'lairbnb_test')
  connection.exec("INSERT INTO spaces (id, name, description, price, startdate, enddate) values (1, 'Deathstar', 'The description', '10','01/01/2020', '01/02/2020');")
  connection.exec("INSERT INTO users (email, password) values ('email@email.com', '#{BCrypt::Password.create("password")}');")
end

def add_row_with_narrow_date_to_test_database
  connection = PG.connect(dbname: 'lairbnb_test')
  connection.exec("INSERT INTO spaces (id, name, description, price, startdate, enddate) values (2, 'Ice Hotel', 'The description', '10','11/11/2020', '11/13/2020');")
end
