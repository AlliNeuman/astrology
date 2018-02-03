require "pry"
class Astrology::Scraper

  def self.scrape_kcstar
    doc = Nokogiri::HTML(open("http://www.kansascity.com/entertainment/horoscopes/"))

    doc.css("div.horoscope").each do |horoscopes|
      horoscope = Astrology::Horoscope.new
      horoscope.name = horoscopes.css("h2.sign").text
      horoscope.dates = horoscopes.css("div.dates").text
      horoscope.summary = horoscopes.css("p").text
      horoscope.lucky_number = horoscopes.css("div.lucky_number").text.gsub("Lucky Number","")
      horoscope.financial_outlook = horoscopes.css("div.financial_outlook").text.gsub("Financial Outlook", "")
        horoscope.compatible_sign = horoscopes.css("div.compatible_sign").text.gsub("Compatible Sign", "")

        horoscope.save
      end
        headline = doc.search("div.teaser h4.title").text.gsub("\n", "")
    end


end
