require 'httparty'
module LiveSoccer
  
  class Checker
    MATCHES_URL = "http://espn.estadao.com.br/temporeal/acoes.listaPartidasAjax.tiles.logic?"
    
    def self.fetch_matches
      HTTParty.get(MATCHES_URL).parsed_response
    end
  end
  
end