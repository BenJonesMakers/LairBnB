require_relative 'database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('lairbnb_test')
else
  DatabaseConnection.setup('lairbnb')
end
