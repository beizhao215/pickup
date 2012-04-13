require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Welcome'" do
      visit '/static_pages/home'
      page.should have_content('Welcome')
    end
    
    it "should have the title 'Home'" do
          visit '/static_pages/home'
          page.should have_selector('title',
                            :text => "FACSS airport pickup | Home")
    end
  end
  
  describe "About page" do

      it "should have the content 'about me'" do
        visit '/static_pages/about'
        page.should have_content('about me')
      end
      
      it "should have the title 'about'" do
            visit '/static_pages/about'
            page.should have_selector('title',
                              :text => "FACSS airport pickup | About")
      end
  end
end