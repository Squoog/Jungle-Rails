require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    context 'password and password_confirmation do not match' do
      it 'produces an error saying the fields must match' do
        user = User.new(first_name: 'egg', last_name: 'farmer', email:'egg@farm.com', password:'eggman', password_confirmation:'eggdude')
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    context 'password field left empty' do
      it "produces error saying the password is not given" do
        user = User.new(first_name: 'egg', last_name: 'farmer', email:'egg@farm.com')
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Password can't be blank")
      end
    end

    context 'password confirmation is not provided' do
      it "gives an error saying password confirmation is needed" do
        user = User.new(first_name: 'egg', last_name: 'farmer', email:'egg@farm.com', password: 'eggman')
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Password confirmation can't be blank")
      end
    end

    context 'email is assigned to another login' do
      it 'produces an error if user enters an email attached to another account' do
        user = User.new(first_name: 'brown', last_name: 'egg', email:'egg@farm.com', password:'eggman', password_confirmation:'eggman')
        user.save

        user2 = User.new(first_name: 'easter', last_name: 'egg', email:'egg@farm.com', password:'eggdude', password_confirmation:'eggdude')
        user2.save

        expect(user2.errors.full_messages).to include("Email has already been taken")
      end
    end

    context 'email field is left empty' do
      it "produces an error saying email field needs to be filled in" do
        user = User.new(first_name: 'brown', last_name: 'egg', password:'eggman', password_confirmation:'eggman')
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Email can't be blank")
      end
    end

    context 'first name not provided' do
      it "produces an error saying first name is required" do
        user = User.new(last_name: 'farmer', email:'egg@farm.com', password:'eggman', password_confirmation:'eggman')
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("First name can't be blank")
      end
    end

    context 'last name not provided' do
      it "produces an error saying last name is required" do
        user = User.new(first_name: 'egg', email:'egg@farm.com', password:'eggman', password_confirmation:'eggman')
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Last name can't be blank")
      end
    end

    context 'password does not reach minimum length requirements' do
      it "gives an error saying password is too short" do
        user = User.new(first_name: 'egg', last_name: 'farmer', email:'egg@farm.com', password:'eggs', password_confirmation:'eggs')
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
      end
    end

  end
end