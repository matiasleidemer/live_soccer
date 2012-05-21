# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "MatchCollection" do
  
  let(:params) { 
    [{ date: DateTime.parse("20May 18h30"), home: "Vasco", visitor: "Grêmio", score: "1 x 2", id: "40075" }, 
     { date: DateTime.parse("20May 18h30"), home: "Cruzeiro", visitor: "Atlético-GO", score: "0 x 0", id: "40085" }] 
  }
  
  describe ".new" do
    it "initializes a new MatchCollection class" do
      LiveSoccer::MatchCollection.new(params).should be_a LiveSoccer::MatchCollection
    end
    
    it "initializes a Match object for each param" do
      match_collection = LiveSoccer::MatchCollection.new params
      match_collection.matches.first.should be_a LiveSoccer::Match
    end
  end
    
end
