require 'spec_helper'

describe "Static Pages" do
  describe "Home page" do
    it "should have content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_content('Sample App')
    end

    it "should have base title 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('title',
                        :text=> "Sample App")        
    end

    it "should not have custom page title 'Home'" do
      visit '/static_pages/home'
      page.should_not have_selector('title',
                            :text=> "Home")
    end
  end
  
  describe "Help Page" do
    it "should have content 'Help'" do
      visit '/static_pages/help'
      page.should have_content('Help')
    end

    it "should have title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title',
                        :text=> "Help")
    end
  end

  describe "About Page" do
    it "should have content 'About Us'" do
      visit '/static_pages/about'
      page.should have_content('About Us')
    end

    it "should have title 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('title',
                        :text=> "About Us")
    end
  end

  describe "Contact Page" do
    it "should have content 'Contact'" do
      visit '/static_pages/contact'
      page.should have_content('Contact')
    end
 
    it "should have title 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('title',
                        :text=> "Contact")
    end
  end
end
