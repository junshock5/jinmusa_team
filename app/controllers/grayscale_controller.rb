require 'open-uri'
class GrayscaleController < ApplicationController
  def index
     @posts = Post.paginate(page: params[:page], per_page:6); 
  end
  
  def crawling
        doc = Nokogiri::HTML(open("http://www.kangwon.ac.kr/www/index.do"))
        subway = doc.css('#tab1_cont > ul > li')
        @subway_time = subway.map { |cur| cur.text }
        
        doc2 = Nokogiri::HTML(open("https://junshock5.github.io/JunResume.github.io/index.html"))
        subway2 = doc2.css('#experience > div > div:nth-child(3) > div')
        @subway_time2 = subway2.map { |cur| cur.text }
  end
  
end
