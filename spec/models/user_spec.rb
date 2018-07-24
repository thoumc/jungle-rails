require 'rails_helper'
RSpec.describe User, type: :model do

  before do
    @user = User.create(
      first_name: 'Sample',
      last_name: 'Person',
      email: 'user@example.com',
      password:'Match',
      password_confirmation: 'Match'
      )
  end

  describe 'Validation' do


    it 'should have first name' do
      @bad_firstname = User.new(
        last_name: 'Person',
        email: 'user1@example.com',
        password:'Match',
        password_confirmation: 'Match'
        )
      expect(@user.first_name).to be_present
      expect(@bad_firstname).to be_invalid
    end

    it 'should have last name' do
      @bad_lastname = User.new(
        first_name: 'Sample',
        email: 'user2@example.com',
        password:'Match',
        password_confirmation: 'Match'
        )
      expect(@user.last_name).to be_present
      expect(@bad_lastname).to be_invalid
    end

    it 'should have email' do
      @bad_email = User.new(
        first_name: 'Sample',
        last_name: 'Person',
        password:'Match',
        password_confirmation: 'Match'
        )
      expect(@user.email).to be_present
      expect(@bad_email).to be_invalid
    end

    it 'should have password' do
      @bad_password = User.new(
        first_name: 'Sample',
        last_name: 'Person',
        email: 'user2@example.com',
        password_confirmation: 'Match'
        )
      expect(@user.password).to be_present
      expect(@bad_password).to be_invalid
    end

    it 'should have password confirmation' do
      @bad_password_confirmation = User.new(
        first_name: 'Sample',
        last_name: 'Person',
        email: 'user4@example.com',
        password: 'Match'
        )
      expect(@user.password_confirmation).to be_present
      expect(@bad_password_confirmation).to be_invalid
    end

    it 'should have password confirmation' do
      @bad_password_match = User.new(
        first_name: 'Sample',
        last_name: 'Person',
        email: 'user4@example.com',
        password: 'Match',
        password_confirmation: 'NotMatch'
        )
      expect(@user).to be_valid
      expect(@bad_password_match).to be_invalid
    end

    it 'should have unique email' do
      @not_unique_email = User.new(
        first_name: 'Bad',
        last_name: 'User',
        email: 'user@example.com',
        password: 'Match',
        password_confirmation: 'Match'
        )
      expect(@user).to be_valid
      expect(@not_unique_email).to be_invalid
    end

    it 'should not have case sensitive email' do
      @case_sensitive_email = User.new(
        first_name: 'Bad',
        last_name: 'User',
        email: 'USER@example.com',
        password: 'Match',
        password_confirmation: 'Match'
        )
      expect(@user).to be_present
      expect(@case_sensitive_email).to be_invalid
    end

    it 'should have password length more than 4 characters' do
      @short_password = User.new(
        first_name: 'Bad',
        last_name: 'User',
        email: 'baduser@example.com',
        password: 'Mat',
        password_confirmation: 'Mat'
        )
      expect(@user).to be_present
      expect(@short_password).to be_invalid
    end

  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.create(
        first_name: 'Sample',
        last_name: 'Person',
        email: 'user@example.com',
        password:'Match',
        password_confirmation: 'Match'
        )
    end

    it 'should stop users does not exist to login' do
      user1 = User.authenticate_with_credentials('user@example.com', 'Match')
      user2 = User.authenticate_with_credentials('invalid_user@example.com', 'Match')
      expect(user1).to be_truthy
      expect(user2).to be_falsey

    end

    it 'should stop users with wrong password to login' do
      user1 = User.authenticate_with_credentials('user@example.com', 'Match')
      user2 = User.authenticate_with_credentials('user@example.com', 'Wrong_Password')
      expect(user1).to be_truthy
      expect(user2).to be_falsey
    end

    it 'should stop users with spaces in front to login' do
      user1 = User.authenticate_with_credentials('user@example.com', 'Match')
      user2 = User.authenticate_with_credentials('   user@example.com', 'Match')
      expect(user1).to be_truthy
      expect(user2).to be_truthy
    end

    it 'should allow users to enter case insensitive email to login' do
      user1 = User.authenticate_with_credentials('user@example.com', 'Match')
      user2 = User.authenticate_with_credentials('USER@example.com', 'Match')
      expect(user1).to be_truthy
      expect(user2).to be_truthy
    end

  end


end
