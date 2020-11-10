require 'space'

describe Space do

  describe '.all' do
    it "shows a list of all spaces" do
      spaces = Space.all

      expect(spaces).to include("Batcave")
      expect(spaces).to include("Moonraker")
      expect(spaces).to include("Ice hotel")
    end
  end

  describe '.add' do
    it "adds a space to the list" do
      spaces = Space.add("Deathstar")
      #expect(spaces).to be_a Space
      expect(spaces).to include("Deathstar")
    end
  end
end
