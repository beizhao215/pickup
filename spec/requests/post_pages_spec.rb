require 'spec_helper'

describe "Post pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  
  before { user.newbie=true }
  before { sign_in user }

  describe "post creation" do
    before { visit user_path(user) }

    describe "with invalid information" do

      it "should not create a post" do
        expect { click_button "Post" }.should_not change(Post, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before { fill_in 'post_arrival_date', with: "2012-08-17" 
               fill_in 'post_arrival_time', with: "21:08"
               fill_in 'post_flight_number', with: "AA2021"
               fill_in 'post_number_of_people', with: "1"
               #fill_in 'post_luggage_number', with: "two 158"
               #fill_in 'post_destination', with: "utd"
               fill_in 'post_note', with: "Lorem ipsum" 
               choose("post_need_pickup_true")
               choose("post_need_housing_true")
            }
      it "should create a post" do
        expect { click_button "Post" }.should change(Post, :count).by(1)
      end
    end
  end
  
  describe "post destruction" do
    before { FactoryGirl.create(:post, user: user) }

    describe "as correct user" do
      before { visit user_path(user) }

      it "should delete a post" do
        expect { click_link "delete" }.should change(Post, :count).by(-1)
      end
    end
  end
end