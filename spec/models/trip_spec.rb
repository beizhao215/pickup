require 'spec_helper'

describe Trip do

  let(:volunteer) { FactoryGirl.create(:user) }
  let(:pickedpost) { FactoryGirl.create(:post) }
  let(:trip) do
    volunteer.trips.build(pickedpost_id: pickedpost.id)
  end
  
  subject { trip }
  
  it {should be_valid}
  
  describe "accessible attributes" do
    it "should not allow access to volunteer_id" do
      expect do
        Trip.new(volunteer_id: volunteer.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end
  
  describe "follower methods" do
    before { trip.save }

    it { should respond_to(:volunteer) }
    it { should respond_to(:pickedpost) }
    its(:volunteer) { should == volunteer }
    its(:pickedpost) { should == pickedpost }
  end
  
  describe "when post id is not present" do
    before { trip.pickedpost_id = nil }
    it { should_not be_valid }
  end

  describe "when volunteer id is not present" do
    before { trip.volunteer_id = nil }
    it { should_not be_valid }
  end
end