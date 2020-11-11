require 'bcrypt'
require_relative 'database_connection'

class User
  attr_reader :id, :email

  def initialize(id, email)
    @id = id
    @email = email
  end

  def self.create(email, password)
    result = DatabaseConnection.query("INSERT INTO users (email, password) VALUES('#{email}', '#{BCrypt::Password.create(password)}') RETURNING id, email;")
    User.new(result[0]['id'], result[0]['email'])
  end

  # def self.check
  #
  # end

  def self.confirmation(p1, p2)
    p1 == p2
  end

end


# def self.add(name:, description:, price:, startdate:, enddate:)
#   DatabaseConnection.query("INSERT INTO spaces (name, description, price, startdate, enddate) VALUES ('#{name}', '#{description}', '#{price}', '#{startdate}', '#{enddate}');")
# end
# # we get password from username and password from db so no method needed for that
# bcrypt gem has password methods built in
