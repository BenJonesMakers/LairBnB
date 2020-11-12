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

  def self.confirmation(p1, p2)
    p1 == p2
  end
#  condition ? if_true : if_false

  def self.verification(email, password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    return false unless result.any?
    return false unless BCrypt::Password.new(result[0]['password']) == password
    User.new(result[0]['id'], result[0]['email'])
  # return result.any? ? true : false
  # return true ? result.any? : false
  # return true ? BCrypt::Password.new(result[0]['password']) == password : false

    # return false ? BCrypt::Password.new(result[0]['password']) != password : true

    # result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    # # if result.empty?
    # if result.nil?
    #   return false
    # end
    #
    # if password == BCrypt::Password.new(result[0]['password'])
    #   return true
    # else
    #   return false
    # end
    # User.new(result[0]['id'], result[0]['email'])
  end

end


# def self.add(name:, description:, price:, startdate:, enddate:)
#   DatabaseConnection.query("INSERT INTO spaces (name, description, price, startdate, enddate) VALUES ('#{name}', '#{description}', '#{price}', '#{startdate}', '#{enddate}');")
# end
# # we get password from username and password from db so no method needed for that
# bcrypt gem has password methods built in
