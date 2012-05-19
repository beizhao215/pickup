# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  note       :string(255)
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Post do

  let(:user) { FactoryGirl.create(:user) }
  before { @post = user.posts.build(note: "Lorem ipsum", 
                                    number_of_people: "1", 
                                    arrival_date: "2012-09-20", 
                                    arrival_time: "21:08", 
                                    flight_number:"AA2021", 
                                    luggage_number: "two 158",
                                    destination: "utd",
                                    need_pickup: true,
                                    need_housing: true) }

  subject { @post }

  it { should respond_to(:note) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }
  it { should respond_to(:number_of_people) }
  it { should respond_to(:arrival_date) }
  it { should respond_to(:arrival_time) }
  it { should respond_to(:flight_number) }
  it { should respond_to(:luggage_number) }
  it { should respond_to(:destination) }
  it { should respond_to(:status) }
  it { should respond_to(:volunteers) }
  it { should respond_to(:entry_port) }
  it { should respond_to(:need_housing) }
  it { should respond_to(:need_pickup) }
  it { should respond_to(:temp_housing_arrangement) }
  
  it { should be_valid }

  describe "when user_id is not present" do
    before { @post.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Post.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end
  
  describe "when user_id is not present" do
    before { @post.user_id = nil }
    it { should_not be_valid }
  end

  describe "with note that is too long" do
    before { @post.note = "a" * 141 }
    it { should_not be_valid }
  end
  
  describe "when number of people is not present" do
    before { @post.number_of_people = nil }
    it { should_not be_valid }
  end
  
  describe "when number of people is not number" do
    before { @post.number_of_people = "one" }
    it { should_not be_valid }
  end
  
end
