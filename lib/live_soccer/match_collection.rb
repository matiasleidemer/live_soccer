module LiveSoccer
  
  class MatchCollection
    attr_accessor :matches
    
    def initialize(attrs)
      self.matches = []
      attrs.each do |match_attrs|
        self.matches << Match.new(match_attrs)
      end
    end
    
  end
end
