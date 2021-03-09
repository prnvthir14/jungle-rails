RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should cre ate a product if all of the validations are true' do
      @category = Category.new(name: "NewThing")
      @product = Product.new(name: "Supreme Nas Tee", price_cents: 3500, quantity: 35, :category => @category)
      @product.valid?
      expect(@product.errors).not_to include("can\'t be blank")
    end
  end
  # pending "add some examples to (or delete) #{__FILE__}"
 end
  
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :email, presence: true, uniqueness: { case_sensitive: false }
  # validates :password_digest, presence: true
  # validates :password, length: { minimum: 6 }
 
 
 
 require 'rails_helper'
  
 RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  describe 'Validations' do
    # validation examples here
    it 'should create a User if all of the validations are true' do
      @user = User.new(first_name: "Jane", last_name: "Doe", email: "janedoe@email.com", password: "ABCDEF", password_confirmation: "ABCDEF")
      @user.valid?
      expect(@user.errors).not_to include("can\'t be blank")
      end
    it 'should not create a User without a first name' do
      @user = User.new(first_name: nil, last_name: "Doe", email:"janedoe@email.com", password: "ABC", password_confirmation:"ABC" )
      @user.valid?
      expect(@user.errors.messages[:first_name]).to include("can't be blank")
      end
    it 'should not create a User without a last name' do
      @user = User.new(first_name: "Jane", last_name: nil, email:"janedoe@email.com", password: "ABC", password_confirmation:"ABC" )
      @user.valid?
      expect(@user.errors.messages[:last_name]).to include("can't be blank")
      end
    it 'should not create a User without an email' do
      @user = User.new(first_name: "Jane", last_name: "Doe", email:nil, password: "ABC", password_confirmation:"ABC" )
      @user.valid?
      expect(@user.errors.messages[:email]).to include("can't be blank")
      end
    it 'should not create a User if password and password confirmation do not match' do
        @user = User.new(first_name: "Jane", last_name: "Doe", email:"janedoe@email.com", password: "ABCDEF", password_confirmation:"ABCDEFG" )
        @user.valid?
        expect(@user.errors.messages[:password_confirmation]).to include("doesn't match Password")
      end
    it 'should not create User if the password is too short' do
      @user = User.new(first_name:"Jane", last_name:"Doe", email:"janedoe@email.com",password: "ABC", password_confirmation: "ABC")
      @user.valid?
      expect(@user.errors.messages[:password]).to include("is too short (minimum is 6 characters)")
    end
    it 'should not create a new User if email is not unique' do
      @user1 = User.new(first_name: "Jane", last_name: "Doe", email:"janedoe@email.com", password: "ABCDEF", password_confirmation:"ABCDEF" )
      @user1.save
      @user2 = User.new(first_name: "John", last_name: "Smith", email:"JANEDOE@email.com", password: "ABCDEFG", password_confirmation:"ABCDEFG" )
      @user2.valid?
      expect(@user2.errors.messages[:email]).to include("has already been taken")
    end
    it 'should not create a new user no password' do
      @user = User.new(first_name:"Jane", last_name:"Doe", email:"janedoe@email.com",password: nil, password_confirmation: nil)
      @user.valid?
      expect(@user.errors.messages[:password]).to include("can't be blank")
    end
    end
  
  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'should log the user in if the credentials are correct' do
      @user = User.new(first_name: "Jane", last_name: "Doe", email: "janedoe@email.com", password: "ABCDEF", password_confirmation: "ABCDEF")
      @user.save!
      expect(User.authenticate_with_credentials("janedoe@email.com", "ABCDEF")).to be_present
    end
    it 'should not log the user in if the email is wrong' do
      @user = User.new(first_name: "Jane", last_name: "Doe", email: "janedoe@email.com", password: "ABCDEF", password_confirmation: "ABCDEF")
      @user.save!
      expect(User.authenticate_with_credentials("jandoe69@email.com", "ABCDEF")).not_to be_present
    end
    it 'should not log the user in if the password is wrong' do
      @user = User.new(first_name: "Jane", last_name: "Doe", email: "janedoe@email.com", password: "ABCDEF", password_confirmation: "ABCDEF")
      @user.save!
      expect(User.authenticate_with_credentials("jandoe69@email.com", "ABCDEFG")).not_to be_present
    end
    it 'should not log the user in if the email is wrong' do
      @user = User.new(first_name: "Jane", last_name: "Doe", email: "janedoe@email.com", password: "ABCDEF", password_confirmation: "ABCDEF")
      @user.save!
      expect(User.authenticate_with_credentials("jandoe69@email.com", "ABCDEF")).not_to be_present
    end
    it 'should log the user in even if the email contains spaces' do
      @user = User.new(first_name: "Jane", last_name: "Doe", email: "janedoe@email.com", password: "ABCDEF", password_confirmation: "ABCDEF")
      @user.save!
      expect(User.authenticate_with_credentials("  janedoe@email.com   ", "ABCDEF")).to be_present
    end
    it 'should log the user in if the email has different letter casing' do
      @user = User.new(first_name: "Jane", last_name: "Doe", email: "janedoe@email.com", password: "ABCDEF", password_confirmation: "ABCDEF")
      @user.save!
      expect(User.authenticate_with_credentials("JANEDOE@email.com", "ABCDEF")).to be_present
    end
  end
 end
 