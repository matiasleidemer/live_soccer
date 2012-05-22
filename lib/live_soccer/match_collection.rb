module LiveSoccer
  
  class MatchCollection
    attr_accessor :matches
    
    def initialize(attrs)
      self.matches = []
      attrs.each do |match_attrs|
        self.matches << Match.new(match_attrs)
      end
    end
    
    def to_s
      return "Sorry, but looks like no one is on the pitch right now..." if self.matches.empty?
      self.matches.map(&:to_s).join "\n"
    end
    
  end
end
