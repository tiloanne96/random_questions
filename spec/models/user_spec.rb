require 'rails_helper'

RSpec.describe User, type: :model do
  context "User validations" do
    it "User without name should be invalid" do
      user = User.new(email: "someemail@mailinator.com")

      expect(user.valid?).to be(false)
    end

    it "User without email should be invalid" do
      user = User.new(name: "somename")

      expect(user.valid?).to be(false)
    end

    it "User with bad email should be invalid" do
      user = User.new(name: "somename", email: "invalid_email@m@ilinator.com")

      expect(user.valid?).to be(false)
    end

    it "User with all data should be valid" do
      user = User.new(name: "somename", email: "valid_email@mailinator.com")
      
      expect(user.valid?).to be(true)
    end
  end
end
