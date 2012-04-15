# == Schema Information
#
# Table name: newbies
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Newbie do

  before { @newbie = Newbie.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar") }

  subject { @newbie }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @newbie.name = "" }
    it { should_not be_valid }
  end
  
  describe "when email is not present" do
    before { @newbie.email = "" }
    it { should_not be_valid }
  end
  
  describe "when password is not present" do
    before { @newbie.password = @newbie.password_confirmation = " " }
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
      before { @newbie.name = "a" * 51 }
      it { should_not be_valid }
  end
  
  describe "when email format is invalid" do
      it "should be invalid" do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
        addresses.each do |invalid_address|
          @newbie.email = invalid_address
          @newbie.should_not be_valid
        end      
      end
    end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.com A_USER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @newbie.email = valid_address
        @newbie.should be_valid
      end      
    end
  end
  
  describe "when email address is already taken" do
      before do
        newbie_with_same_email = @newbie.dup
        newbie_with_same_email.email = @newbie.email.upcase
        newbie_with_same_email.save
      end

      it { should_not be_valid }
  end
 
  describe "when password doesn't match confirmation" do
    before { @newbie.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
  
  describe "when password confirmation is nil" do
    before { @newbie.password_confirmation = nil }
    it { should_not be_valid }
  end
  
  describe "with a password that's too short" do
      before { @newbie.password = @newbie.password_confirmation = "a" * 5 }
      it { should be_invalid }
  end
  
  describe "return value of authenticate method" do
    before { @newbie.save }
    let(:found_newbie) { Newbie.find_by_email(@newbie.email) }

    describe "with valid password" do
      it { should == found_newbie.authenticate(@newbie.password) }
    end

    describe "with invalid password" do
      let(:newbie_for_invalid_password) { found_newbie.authenticate("invalid") }

      it { should_not == newbie_for_invalid_password }
      specify { newbie_for_invalid_password.should be_false }
    end
  end
  
end