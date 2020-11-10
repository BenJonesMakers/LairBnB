require 'space'
require 'date'
describe Space do

  describe '.all' do
    it "shows a list of all spaces" do
      spaces = Space.all

      expect(spaces[0].name).to include("Deathstar")
      # expect(spaces).to include("Moonraker")
      # expect(spaces).to include("Ice hotel")
    end
  end

  describe '.add' do
    it "adds a space to the list" do
      Space.add("Deathstar")
      spaces = Space.all
      #expect(spaces).to be_a Space
      expect(spaces[0].name).to include("Deathstar")
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
