class Astrology::Cli

  def call
    @headline = Astrology::Scraper.scrape_kcstar
    list_horoscopes
    menu
    goodbye
  end

  def list_horoscopes
    Astrology::Horoscope.all.each.with_index(1) do |horoscope, i|
      puts "#{i}. #{horoscope.name}"
    end
  end

  def menu

  end



end
