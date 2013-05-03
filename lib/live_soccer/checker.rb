require 'httparty'
require 'nokogiri'

class Nokogiri::XML::Node
  def soccer_value(selector)
    self.css(selector).first.content.strip
  end
end

module LiveSoccer
  class Checker
    MATCHES_URL = "http://www.espn.com.br/old/temporeal/acoes.listaPartidasAjax.tiles.logic?"
    
    def self.fetch_matches
      @fetch_matches ||= HTTParty.get(MATCHES_URL).parsed_response
    end
    
    def self.parse_matches
      [].tap do |matches|
        self.each_match do |match|
          date = "#{match.soccer_value 'li.noticia_dia'} #{match.soccer_value 'li.noticia_hora'} -03:00"
          
          matches << { date: DateTime.parse(date), 
                       home: match.soccer_value('div.jogo td.time1'),
                       visitor: match.soccer_value('div.jogo td.time2'), 
                       score: match.css('div.jogo td.placar').last.content.strip,
                       id: match.css('div.jogo td.placar a').first && match.css('div.jogo td.placar a').first.attributes["href"].value.split("id=").last }
        end
      end
    end
    
  private
    def self.each_match
      Nokogiri::HTML.parse(self.fetch_matches).css('div.bloco_jogos').each do |link|
        yield link
      end
    end    
  end
  
end
