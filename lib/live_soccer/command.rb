require 'thor'

module LiveSoccer
  class Command < Thor
    default_task :show

    desc "show", "shows the current matches(if any) and the results"
    def show
      collection = LiveSoccer::MatchCollection.new(LiveSoccer::Checker.parse_matches)
      puts collection.to_s
    end
  end
end