require 'spec_helper'
require 'capybara/rspec'

describe "the articles interface" do
  before(:all) do
    @articles = []
    3.times{ @articles << Fabricate(:article) }
  end
  
  describe "on the index page" do
    before(:each) do
      visit articles_path
    end

    it "should list the article titles on the index" do
      @articles.each do |article|
        page.should have_content(article.title)
      end
    end

    it "should list the article titles on the index"  do
      @articles.each do |article|
        page.should have_link(article.title)
      end
    end
    
    it "should show the page title in all caps", :js => true do
      page.should have_selector("h1", :text => "ALL ARTICLES")
    end    
  end
  
  after(:all) do

  end
  
end