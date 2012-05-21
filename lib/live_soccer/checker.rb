require 'httparty'
require 'nokogiri'

module LiveSoccer
  
  class Checker
    MATCHES_URL = "http://espn.estadao.com.br/temporeal/acoes.listaPartidasAjax.tiles.logic?"
    
    def self.fetch_matches
      @fetch_matches ||= HTTParty.get(MATCHES_URL).parsed_response
    end
    
    def self.parse_matches
      [].tap do |matches|
        self.each_match do |match|
          matches << { date: DateTime.parse(match.css('li.noticia_hora').first.content), 
                       home: match.css('div.jogo td.time1').first.content.strip, 
                       visitor: match.css('div.jogo td.time2').first.content.strip, 
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