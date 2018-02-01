class Astrology::Scraper

  def self.scrape_kcstar
    doc = Nokogiri::HTML(open("http://www.kansascity.com/entertainment/horoscopes/"))
    # horoscope.headline = doc.search("div.teaser h4.title").text.gsub("\n", "")

    doc.css("div.horoscope").each do |horoscope|
      horoscope = self.new
      horoscope.name = horoscope.css("h2.sign").text
      horoscope.dates = horoscope.css("div.dates").text
      horoscope.summary = horoscope.css("p").text
      horoscope.lucky_number = horoscope.css("div.lucky_number").text.gsub("Lucky Number","")
      horoscope.financial_outlook = horoscope.css("div.financial_outlook").text.gsub("Financial Outlook", "")
        horoscope_compatible_sign = horoscope.css("div.compatible_sign").text.gsub("Compatible Sign", "")

        @@all << horoscope

      end
    end

end
