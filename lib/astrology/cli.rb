require 'pry'

class Astrology::Cli

  def call
    Astrology::Scraper.scrape_kcstar
    list_horoscopes
    menu
    goodbye
  end

  def list_horoscopes

  end

  def menu

  end




end
