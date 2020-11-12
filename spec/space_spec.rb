require 'space'
require 'date'
describe Space do

  describe '.all' do
    it "shows a list of all spaces" do

      add_row_to_test_database()
      spaces = Space.all

      expect(spaces[0].name).to include("Deathstar")
    end
  end

  describe '.add' do
    it "adds a space to the list" do
      Space.add(name: "Deathstar",
            description: "The description",
            price: "10",
            startdate: "01/01/2020",
            enddate: "02/01/2020")
      spaces = Space.all

      expect(spaces[0].name).to include("Deathstar")
      expect(spaces[0].description).to eq "The description"
      expect(spaces[0].price).to eq "10"
      expect(spaces[0].startdate).to eq "2020-01-01"
      expect(spaces[0].enddate).to eq "2020-01-02"

    end

  end

  describe 'initialize' do
    it "creates an instance of space" do
      space = Space.new(id: "1",
                        name: "Deathstar",
                        description: "excellent views from the star destroyer.",
                        price: "39",
                        startdate: Time.now,
                        enddate: Time.now)

      expect(space).to be_a Space
    end
  end

end
