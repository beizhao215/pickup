require 'spec_helper'

describe "Newbie pages" do

  subject { page }

  describe "signup page" do
    before { visit signupnewbie_path }

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: full_title('Sign up')) }
  end
  
  describe "profile page" do
    let(:newbie) { FactoryGirl.create(:newbie) }
    before { visit newby_path(newbie)}

    it { should have_selector('h1',    text: newbie.name) }
    it { should have_selector('title', text: newbie.name) }
  end
  
  describe "signup" do

      before { visit signupnewbie_path }

      let(:submit) { "Create my account" }

      describe "with invalid information" do
        it "should not create a newbie" do
          expect { click_button submit }.not_to change(Newbie, :count)
        end
      end

      describe "with valid information" do
        before do
          fill_in "Name",         with: "Example Newbie"
          fill_in "Email",        with: "newbie@example.com"
          fill_in "Password",     with: "foobar"
          fill_in "Confirmation", with: "foobar"
        end

        it "should create a newbie" do
          expect { click_button submit }.to change(Newbie, :count).by(1)
        end
      end
    end
    
end