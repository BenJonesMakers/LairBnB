require 'space'
require 'date'
describe Space do

  describe '.all' do
    it "shows a list of all spaces" do
      spaces = Space.all

      expect(spaces[0].name).to include("Deathstar")
    end
  end

  describe '.add' do
    it "adds a space to the list" do
      Space.add(name: "Deathstar", description: "The description", price: "10")
      spaces = Space.all
      p spaces[0]

      expect(spaces[0].name).to include("Deathstar")
      expect(spaces[0].description).to eq "The description"
      expect(spaces[0].price).to eq "10"

    end
  end

  describe 'initialize' do
    it "creates an instance of space" do
      space = Space.new(id: "1", name: "Deathstar", description: "excellent views from the star destroyer.", price: "39", startdate: Time.now, enddate: Time.now )
      # :id => 1
      # :name => "Deathstar"
      #  :description => 'excellent views from the star destroyer.'
      #  :price => 39
      #  :startdate => Time.now
      #  :enddate => Time.now

      expect(space).to be_a Space
    end
  end

end
