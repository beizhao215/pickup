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
  before { @post = user.posts.build(note: "Lorem ipsum") }

  subject { @post }

  it { should respond_to(:note) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }
  
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

  describe "with blank note" do
    before { @post.note = " " }
    it { should_not be_valid }
  end

  describe "with note that is too long" do
    before { @post.note = "a" * 141 }
    it { should_not be_valid }
  end
end
