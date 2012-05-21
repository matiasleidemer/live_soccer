# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Match" do
  
  let(:match) { LiveSoccer::Match }
  let(:params) { { date: DateTime.parse("20May 18h30"), home: "Vasco", visitor: "Grêmio", score: "1 x 2", id: "40075" } }
  
  describe ".new" do
    it "initializes a new Match class" do
      match.new(params).should be_a LiveSoccer::Match
    end
  end
  
end
