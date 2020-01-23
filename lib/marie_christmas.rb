require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_url_to_every_mairie_MTFCK
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

  urls_array = Array.new

  scrappe_url_of_all_pages = page.xpath("//p/a/@href")
  scrappe_url_of_all_pages.each do |url|
    urls_array << "http://annuaire-des-mairies.com#{url.text.delete_prefix(".")}"
  end
  return urls_array
end


def search_each_pages(urls_array)
  name_and_email_town_array = Array.new

  urls_array.each do |url|
    page = Nokogiri::HTML(open("#{url}"))
    hash_ongoing = Hash.new
    scrappe_email_mairie = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]/text()")
    scrappe_mairie_name = page.xpath("//strong/a/text()")
    hash_ongoing[scrappe_mairie_name.text] = scrappe_email_mairie.text
    name_and_email_town_array.push(hash_ongoing)
  end
  return name_and_email_town_array
end

#p search_each_pages(get_url_to_every_mairie_MTFCK)
