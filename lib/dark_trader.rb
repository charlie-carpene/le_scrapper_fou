require 'rubygems'
require 'nokogiri'
require 'open-uri'



def scrappe_it_all_and_add_it_to_an_hash
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

  currencies_array = []
  price_array = []
  a = []

  scrappe_currencies_array = page.xpath("/html/body/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody//tr/td[3]/div")
  scrappe_price_array = page.xpath("/html/body/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody//tr/td[5]/a")

  scrappe_currencies_array.each {|currencie| currencies_array.push(currencie.text)}
  scrappe_price_array.each {|price| price_array.push(price.text.tr('$', '').to_f)}

  return currencies_with_price_hash = [currencies_array, price_array].transpose.to_h
end

def rearrange_the_hash_in_one_array(scrappe_it_all_and_add_it_to_an_hash)
  a = []
  scrappe_it_all_and_add_it_to_an_hash.each do |key, value|
    hash = Hash.new
    hash[key] = value
    a.push(hash)
  end
  return a
end

p rearrange_the_hash_in_one_array(scrappe_it_all_and_add_it_to_an_hash)
