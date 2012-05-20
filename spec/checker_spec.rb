require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Checker" do
  let(:checker) { LiveSoccer::Checker }
  let(:matches_url) { LiveSoccer::Checker::MATCHES_URL }
  
  before :all do
    FakeWeb.register_uri(:get, matches_url, :body => File.open(File.expand_path(File.dirname(__FILE__) + '/support/all_matches.html')).read)
  end
  
  describe ".fetch_matches" do
    it "fetches data from the matches URL" do
      checker.fetch_matches.should_not be_nil
    end
  end
  
end
