# encoding: UTF-8
module LiveSoccer
  class Match
    attr_accessor :id, :date, :home, :visitor, :score, :penalty_home, :penalty_visitor
    
    def initialize(attrs)
      self.id      = attrs.fetch :id
      self.date    = attrs.fetch :date
      self.home    = attrs.fetch :home
      self.visitor = attrs.fetch :visitor
      self.score   = attrs.fetch :score
      self.penalty_home    = attrs.delete(:penalty_home)    || nil
      self.penalty_visitor = attrs.delete(:penalty_visitor) || nil
    end
    
    def to_s
      "#{date.strftime("%d%b %H:%M")} - #{self.home} #{score_and_penalties} #{self.visitor}"
    end
    
    def score_and_penalties
      with_penalties { self.score }
    end
    
  private
    def with_penalties
      "".tap do |output|
        output << "(#{self.penalty_home}) " if self.penalty_home
        output << yield
        output << " (#{self.penalty_visitor})" if self.penalty_visitor
      end
    end
  end
end
