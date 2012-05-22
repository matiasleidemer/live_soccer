# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "MatchCollection" do
  
  let(:params) { 
    [{ date: DateTime.parse("20May 18h30"), home: "Vasco", visitor: "Grêmio", score: "1 x 2", id: "40075" }, 
     { date: DateTime.parse("20May 18h30"), home: "Cruzeiro", visitor: "Atlético-GO", score: "0 x 0", id: "40085" }] 
  }
  let(:match_collection) { LiveSoccer::MatchCollection.new params }
  
  describe ".new" do
    it "initializes a new MatchCollection class" do
      LiveSoccer::MatchCollection.new(params).should be_a LiveSoccer::MatchCollection
    end
    
    it "initializes a Match object for each param" do
      match_collection.matches.first.should be_a LiveSoccer::Match
    end
  end
  
  describe "#to_s" do
    context "with running matches" do
      it "prints each Match" do
        match_collection.to_s.should == "20May 18:30 - Vasco 1 x 2 Grêmio\n20May 18:30 - Cruzeiro 0 x 0 Atlético-GO"
      end
    end
    
    context "without running matches" do
      it "prints a message" do
        match_collection = LiveSoccer::MatchCollection.new []
        match_collection.to_s.should == "Sorry, but looks like no one is on the pitch right now..."
      end
    end
  end
  
end
