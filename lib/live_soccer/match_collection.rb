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
      self.matches.map(&:to_s).join "\n"
    end
    
  end
end
