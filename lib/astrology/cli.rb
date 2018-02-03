class Astrology::Cli

  def call
    @headline = Astrology::Scraper.scrape_kcstar
    Astrology::Scraper.scraper
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
    input = nil
    while input != "exit"

      puts "To see your horoscope, enter the number 1-12 that corresponds with your astrological sign."
      puts "Alternatively, type 'list' to see the list of signs or type 'exit'"
      input = gets.strip.downcase
      if input.to_i > 0
        horoscope = Astrology::Horoscope.all[input.to_i - 1]
        puts "#{@headline}"
        puts "#{horoscope.name}"
        puts "#{horoscope.dates}"
        puts "#{horoscope.summary}"
        puts "Lucky Number: #{horoscope.lucky_number}"
        puts "Financial Outlook: #{horoscope.financial_outlook}"
        puts "Partner Compatibility: #{horoscope.compatible_sign}"


      elsif input == "list"
        list_horoscopes
      else
        "not sure what you want, type 'list' or 'exit'"
      end
    end
  end

  def goodbye
    puts "check back again for your daily horoscope!"
  end

  def paragraph_summary


    paragraph = @summary
    words = paragraph.split(" ")
    current_line = nil
    correct_width = words.map do |word|
      letter_count = word.split("").count
      current_line += letter_count + 1 #To count the space after
      if current_line < 50
        word
      else
        current_line = 0
        "\n#{word}"
      end
    end
    correct_width.join(" ")
  end

  def paragraph_summary


    paragraph = @summary
    words = paragraph.split(" ")
    current_line = nil
    correct_width = words.map do |word|
      letter_count = word.split("").count
      current_line += letter_count + 1 #To count the space after
      if current_line < 50
        word
      else
        current_line = 0
        "\n#{word}"
      end
    end
    correct_width.join(" ")
  end

end
