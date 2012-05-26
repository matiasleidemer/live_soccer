# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Checker" do
  let(:matches_url) { LiveSoccer::Checker::MATCHES_URL }
  
  before :each do
    FakeWeb.register_uri(:get, matches_url, :body => File.open(File.expand_path(File.dirname(__FILE__) + '/support/all_matches.html')).read)
  end
  
  describe ".fetch_matches" do
    it "fetches data from the matches URL" do
      LiveSoccer::Checker.fetch_matches.should_not be_nil
    end
  end
  
  describe ".parse_matches" do
    let(:match) { { date: DateTime.parse("24May 20h00 -03:00"), home: "Santos", visitor: "Vélez Sarsfield", score: "1 x 0", id: "39230" } }
    
    it "parses the matches" do
      LiveSoccer::Checker.parse_matches.first.should == match
    end
    
  end
  
  
end
