# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Match" do
  
  let(:params) { { date: DateTime.parse("20May 18h30"), home: "Vasco", visitor: "Grêmio", score: "1 x 2", id: "40075" } }
  let(:match)  { LiveSoccer::Match.new params }
  
  describe ".new" do
    it "initializes a new Match class" do
      LiveSoccer::Match.new(params).should be_a LiveSoccer::Match
    end
  end
  
  describe "#to_s" do
    it "returns the match as a string" do
      match.to_s.should == "20May 18:30 - Vasco 1 x 2 Grêmio"
    end
    
    it "returns the match with penalties score" do
      match.penalty_home = "4"
      match.penalty_visitor = "5"
      match.to_s.should == "20May 18:30 - Vasco (4) 1 x 2 (5) Grêmio"
    end
  end
  
end
