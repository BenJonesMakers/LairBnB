require 'space'

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
            description: "excellent views from the star destroyer.",
            price: "39",
            startdate: "01/01/2020",
            enddate: "02/01/2020")
      spaces = Space.all
      p spaces[0]

      expect(spaces[0].name).to include("Deathstar")
      expect(spaces[0].description).to eq "excellent views from the star destroyer."
      expect(spaces[0].price).to eq "39"
      expect(spaces[0].startdate).to eq "2020-01-01"
      expect(spaces[0].enddate).to eq "2020-02-01"

    end

  end

  describe 'initialize' do
    it "creates an instance of space" do
      space = Space.new(id: "1",
                        name: "Deathstar",
                        description: "excellent views from the star destroyer.",
                        price: "39",
                        startdate: '11-11-2020',
                        enddate: '13-11-2020')

      expect(space).to be_a Space
    end
  end

  describe '#availability' do
    it 'respond to .availability' do
      space = Space.new(id: "1",
                        name: "Deathstar",
                        description: "excellent views from the star destroyer.",
                        price: "39",
                        startdate: '11-11-2020',
                        enddate: '13-11-2020')
      expect(space).to respond_to(:availability)
    end

    it 'returns an array containg hashes for the days of the month' do
      space = Space.new(id: "1",
                        name: "Deathstar",
                        description: "excellent views from the star destroyer.",
                        price: "39",
                        startdate: '11-11-2020',
                        enddate: '13-11-2020')
      expect(space.availability(11, 2020)).to eq [11, 12, 13]
    end
  end

  describe '#self.specific_space(id)' do
    it 'the method responds' do
      expect(Space).to respond_to(:specific_space).with(1).argument
    end

    it 'returns a lair object' do
      add_row_to_test_database()
      expect(Space.specific_space(1)).to be_a Space
    end
  end

end
