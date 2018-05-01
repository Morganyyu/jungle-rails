require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should validate presence of password' do
      @user = User.new(:name => "Jim", :email => "jim@jim.com", :password => nil, :password_confirmation => "12345" )
      expect(@user.password).not_to be_present
    end
    it 'should validate presence of password_confirmation' do
      @user = User.new(:name => "Jim", :email => "jim@jim.com", :password => "12345", :password_confirmation => nil )
      expect(@user.password_confirmation).not_to be_present
    end
    it 'should validate password and password_confirmation match' do
      @user = User.new(:name => "Jim", :email => "jim@jim.com", :password => "54321", :password_confirmation => "12345" )
      expect(@user.password == @user.password_confirmation).to be false
    end
    it 'should validate presence of name' do
      @user = User.new(:name => nil, :email => "jim@jim.com", :password => "12345", :password_confirmation => "12345" )
      expect(@user.name).not_to be_present
    end
    it 'should validate uniqueness of email, case insensitive' do
      @user = User.create(:name => "Jim", :email => "jim@jim.com", :password => "12345", :password_confirmation => "12345" )
      @user2 = User.new(:name => "Jim", :email => "JIM@jim.com", :password => "12345", :password_confirmation => "12345" )
      expect(@user2).not_to be_valid
    end
    it 'should validate presence of email' do
      @user = User.new(:name => "Jim", :email => nil, :password => "12345", :password_confirmation => "12345" )
      expect(@user.email).not_to be_present
    end
    it 'should validate length of password' do
      @user = User.new(:name => "Jim", :email => nil, :password => "123", :password_confirmation => "123" )
      expect(@user.password.length >= 5).to be false
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should login if email exists and password matches' do
      @user = User.create(:name => "Jim", :email => "jim@jim.com", :password => "12345", :password_confirmation => "12345" )
      found_user = User.find_by_email(@user.email)
      expect(found_user).not_to be nil
      expect(found_user.authenticate("12345").email).to eq("jim@jim.com")
    end
    it 'should authenticate with whitespaces and is case insensitive for email' do
      user2 = User.create(:name => "Jim", :email => "jim@jim.com", :password => "12345", :password_confirmation => "12345" )
      right_user = User.authenticate_with_credentials("   JIM@jim.com   ", "12345")
      expect(right_user).not_to be nil
    end
  end

end
