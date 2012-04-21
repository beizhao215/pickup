require 'spec_helper'

describe "Static pages" do
  
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Welcome')}
    
    it { should have_selector('title', :text => full_title('')) }
    
    it { should_not have_selector('title', :text => '| Home') }
  end
  
  describe "About page" do
    before { visit about_path }

      it { should have_content('about me') }
      
      it { should have_selector('title', :text => full_title('About')) }
  end
  
  it "should have the right links on the layout" do
      visit root_path
      click_link "About"
      page.should have_selector 'title', text: full_title('About')
      click_link "Home"
      page.should have_selector('title', :text => full_title(''))
      click_link "Sign up!"
      page.should have_selector('title', text: full_title('Sign up'))
    end
end