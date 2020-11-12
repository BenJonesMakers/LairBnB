require_relative 'database_connection'
require_relative 'database_check'

class Space
  attr_reader :id, :name, :description, :price, :startdate, :enddate

  def initialize(id:, name:, description:, price:, startdate:, enddate:)
    @id = id
    @name = name
    @description = description
    @price = price
    @startdate = startdate
    @enddate = enddate

  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces;")
    result.map do |lair|
      p lair
      Space.new(id: lair['id'],
                name: lair['name'],
                description: lair['description'],
                price: lair['price'],
                startdate: lair['startdate'],
                enddate: lair['enddate'])
    end
  end

  def self.add(name:, description:, price:, startdate:, enddate:)
    DatabaseConnection.query("INSERT INTO spaces
                            (name, description, price, startdate, enddate)
                            VALUES ('#{name}',
                                    '#{description}',
                                    '#{price}',
                                    '#{startdate}',
                                    '#{enddate}');")
  end

  def self.specific_space(id)
    result = DatabaseConnection.query("SELECT * FROM spaces WHERE id = #{id};")
    result.map do |lair|
      return Space.new(id: lair['id'],
                name: lair['name'],
                description: lair['description'],
                price: lair['price'],
                startdate: lair['startdate'],
                enddate: lair['enddate'])
    end
  end

  def availability(month, year)
    temp_array, number_of_days = [], 31
    day_count = 1
    while  day_count <= number_of_days
      test_date = day_count.to_s + "-" + month.to_s + "-" + year.to_s

      if check_availability(test_date)
        temp_array.push(day_count)
      end

      day_count += 1
    end
    return temp_array
  end

private

  def check_availability(date)
    return true if date >= @startdate && date <= @enddate
  end

end
