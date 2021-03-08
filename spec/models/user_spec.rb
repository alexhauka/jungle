require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do

    it "a user is invalid if password fields do not match" do
      @user = User.create email: 'something@example.com', first_name: 'John', last_name: 'Doe', password: 'badpassword', password_confirmation: 'alsobadpassword'

      expect(@user.valid?).to be false
      # puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

    end

    it "a user is invalid if a password field is blank" do
      @user = User.create email: 'something@example.com', first_name: 'John', last_name: 'Doe', password: 'badpassword', password_confirmation: nil

      expect(@user.valid?).to be false
      # puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "a user is invalid if email is not unique" do

      @user_with_email = User.create email: 'something@example.com', first_name: 'John', last_name: 'Doe', password: 'badpassword', password_confirmation: 'badpassword'

      @user = User.create email: 'something@example.com', first_name: 'Jane', last_name: 'Doe', password: 'alsobadpassword', password_confirmation: 'alsobadpassword'

      expect(@user.valid?).to be false
      # puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end

    it "a user is invalid if email field is blank" do
      @user = User.create email: nil, first_name: 'John', last_name: 'Doe', password: 'badpassword', password_confirmation: 'badpassword'

      expect(@user.valid?).to be false
      # puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "a user is invalid if first name field is blank" do
      @user = User.create email: 'something@example.com', first_name: nil, last_name: 'Doe', password: 'badpassword', password_confirmation: 'badpassword'

      expect(@user.valid?).to be false
      # puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "a user is invalid if last name field is blank" do
      @user = User.create email: 'something@example.com', first_name: 'John', last_name: nil, password: 'badpassword', password_confirmation: 'badpassword'

      expect(@user.valid?).to be false
      # puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "a user is invalid if password is less than 6 chars" do
      @user = User.create email: 'something@example.com', first_name: 'John', last_name: 'Doe', password: 'poopy', password_confirmation: 'poopy'

      expect(@user.valid?).to be false
      # puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end  
  end

  describe '.authenticate_with_credentials' do

    before do
      @user = User.create email: 'somEthing@EXAmple.com', first_name: 'John', last_name: 'Doe', password: 'poopypants', password_confirmation: 'poopypants'
    end
    
    it "a user is logged in with the correct credentials" do
      @logged_user = User.authenticate_with_credentials('something@example.com', 'poopypants')

      expect(@logged_user).to_not be nil
    end

    it "a user cannot log in with the wrong password" do
      @logged_user = User.authenticate_with_credentials('something@example.com', 'poopybottom')

      expect(@logged_user).to be nil
    end

    it "a user is logged in with spaces before or after their correct email" do
      @logged_user = User.authenticate_with_credentials('  something@example.com   ', 'poopypants')

      expect(@logged_user).to_not be nil
    end

    it "a user is logged in with mixed case for the correct email" do
      @logged_user = User.authenticate_with_credentials('SometHing@EXAMPLE.com', 'poopypants')

      expect(@logged_user).to_not be nil
    end


  end

end
