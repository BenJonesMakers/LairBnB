require './lib/user'

describe User do
  describe '.create' do
    it "creates a new user" do
      user = User.create("email@email.com", "password")
      expect(user).to be_a User
      setup_test_database()
      add_row_to_test_database()
      # expect(user[0].id).to eq id[0]['id']
      id = DatabaseConnection.query("SELECT id FROM users WHERE email ='email@email.com';")
      expect(user.email).to eq "email@email.com"
      expect(user.id.to_i + 1).to eq id[0]['id'].to_i
    end
  end

  describe '.confirmation' do
    it "returns true if passwords match" do
      expect(User.confirmation("p1", "p1")).to eq true
    end
    it "returns false if passwords do not match" do
      expect(User.confirmation("p1", "p2")).to eq false
    end
  end

  describe '.verification' do
    it "returns false if the email is wrong" do
      expect(User.verification("wrong@email.com", "password")).to eq false
    end

    it "returns false if password is wrong and email is correct" do # index out of range rspec?
      expect(User.verification("email@email.com", "wrong")).to eq false
    end
  end

end
