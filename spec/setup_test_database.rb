require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'lairbnb_test')
  connection.exec("TRUNCATE spaces;")
end

def add_row_to_test_database
  connection = PG.connect(dbname: 'lairbnb_test')
  connection.exec("INSERT INTO spaces (id, name, description, price, startdate, enddate) values (1, 'Deathstar', 'The description', '10','01/01/2020', '01/02/2020');")
end
