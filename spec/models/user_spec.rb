require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(first_name: 'Olivia',
                        last_name: 'Power',
                        email: '  test@test.com',
                        password: 'abcd1234',
                        password_confirmation: 'abcd1234')
  }
  
  describe 'Validations' do
    # validation tests/examples here
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it 'should validate that a password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
    it 'should validate first_name exisit' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end
    it 'should validate last_name exisit' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
    it 'should validate email exisit' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it 'should validate check is password and confirmation match' do
      subject.password = 'acc'
      expect(subject.password).not_to equal(subject.password_confirmation)
    end
    it 'should be invalid if email exist' do
      user = User.new(first_name: 'Bob',
                      last_name: 'Power',
                      email: '  test@test.coM',
                      password: 'abc1234',
                      password_confirmation: 'abc1234')

      user.save
      expect(subject).to_not be_valid
    end
    it 'should be invalid if email exist' do
      subject.password = 'abc'
      expect(subject).to_not be_valid
    end
  end
  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'should authenticate user' do
      User.authenticate_with_credentials(subject.email, subject.password)
      expect(subject).to_not be_nil
    end
    it 'should authenticate user with spaces in email' do
      User.authenticate_with_credentials(subject.email, subject.password)
      expect(subject).to_not be_nil
    end
  end
end