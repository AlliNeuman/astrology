class Astrology::Horoscope

  attr_accessor :headline, :name, :dates, :summary, :lucky_number, :financial_outlook, :compatibility

  @@all = []

  def self.all
    @@all
  end


end
