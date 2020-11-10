require 'database_connection'
require 'setup_test_database'

describe DatabaseConnection do
  describe 'setup' do
    it "connects to the database" do
      expect(PG).to receive(:connect).with(dbname: 'lairbnb_test')
      DatabaseConnection.setup('lairbnb_test')
    end
  end

  describe '.query' do
    it "it runs sql query on database" do
      connection = DatabaseConnection.setup('lairbnb_test')
      expect(connection).to receive(:exec).with("SELECT * FROM spaces;")
      DatabaseConnection.query('SELECT * FROM spaces;')
    end

    it "adds row to test database" do
      add_row_to_test_database()
      result = DatabaseConnection.query('SELECT * FROM spaces;')
      expect(result.count).to eq 1
    end
  end
end
