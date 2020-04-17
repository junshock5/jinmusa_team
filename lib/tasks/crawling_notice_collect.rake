namespace :crawling_notice_collect do
  desc "TODO"
  task crawling_notice_collect: :environment do
      doc = Nokogiri::HTML(open("http://www.kangwon.ac.kr/www/index.do")) # 열고
      @posts = doc.css('(CSS)')
      @posts.each do |x| #각각 돌면서 Result에 추가해줍니다.
      require 'open-uri'
      tit = x.css('(이하 CSS)').text
      @res = (모델명).new(title: tit)
      @res.save
  end



  end

end
