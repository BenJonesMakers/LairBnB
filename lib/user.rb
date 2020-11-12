require 'bcrypt'
require_relative 'database_connection'

class User
  attr_reader :id, :email

  def initialize(id, email)
    @id = id
    @email = email
  end

  def self.create(email, password)
    result = DatabaseConnection.query("INSERT INTO users (email, password)
    VALUES('#{email}', '#{BCrypt::Password.create(password)}') RETURNING id, email;")
    User.new(result[0]['id'], result[0]['email'])
  end

  def self.confirmation(pw1, pw2)
    pw1 == pw2
  end

  def self.verification(email, password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    return false unless result.any?
    return false unless BCrypt::Password.new(result[0]['password']) == password
    
    User.new(result[0]['id'], result[0]['email'])
  end
end
