# encoding: UTF-8
module LiveSoccer
  class Match
    attr_accessor :id, :date, :home, :visitor, :score
    
    def initialize(attrs)
      self.id      = attrs.fetch :id
      self.date    = attrs.fetch :date
      self.home    = attrs.fetch :home
      self.visitor = attrs.fetch :visitor
      self.score   = attrs.fetch :score
    end
    
    def to_s
      "#{date.strftime("%d%b %H:%M")} - #{self.home} #{self.score} #{self.visitor}"
    end
    
  end
end
