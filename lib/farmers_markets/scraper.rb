class Scraper

  def self.scrape_markets
    puts "Scraping markets"
    doc = Nokogiri::HTML(open("http://www.farma.org.uk/members-map/"))
    my_markets = []
    doc.css("div.map-member").each do |member|
      this_market = {}
      this_market[:name] = member.css("h4").text
      this_market[:postcode] = member.css("div.postcode").text
      this_market[:details_link] = member.css("a.read-more").attribute("href").value
      this_market[:district] = member.css("div.postcode").text.gsub(/\d+[a-z]?\s?\d[a-z]+.\z/i, "").upcase
      my_markets << this_market
    end
    my_markets
  end

  def self.scrape_contact_details(market_url)
    puts "Scraping details"
    doc = Nokogiri::HTML(open(market_url))
    details_doc = doc.css("div.row-fluid")
    contact_details = {}
    details_doc.css("p").each do |detail|
      if detail.text.include?("Telephone")
        contact_details[:telephone] = detail.text
      elsif detail.text.include?("Email")
        contact_details[:email] = detail.text
      elsif detail.text.include?("Website")
        contact_details[:website] = detail.text
      else
        contact_details[:membership] = detail.text
      end
    end
    contact_details
  end

end
