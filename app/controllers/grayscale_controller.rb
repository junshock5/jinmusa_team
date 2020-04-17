require 'open-uri'
class GrayscaleController < ApplicationController
  def index
  end
  
  def crawling
        doc = Nokogiri::HTML(open("http://www.kangwon.ac.kr/www/index.do"))
        subway = doc.css('#tab1_cont > ul > li')
        @subway_time = subway.map { |cur| cur.text }
      
  end
  
end
