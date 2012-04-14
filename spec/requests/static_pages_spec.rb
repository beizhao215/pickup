require 'spec_helper'

describe "Static pages" do
  
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Welcome')}
    
    it { should have_selector('title', :text => "FACSS airport pickup") }
    
    it { should_not have_selector('title', :text => '| Home') }
  end
  
  describe "About page" do
    before { visit about_path }

      it { should have_content('about me') }
      
      it { should have_selector('title', :text => "FACSS airport pickup | About") }
  end
end