class Astrology::Horoscope

  attr_accessor :headline, :name, :dates, :summary, :lucky_number, :financial_outlook, :compatible_sign

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self

  end

end
