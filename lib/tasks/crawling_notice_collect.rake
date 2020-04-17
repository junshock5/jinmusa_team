namespace :crawling_notice_collect do
  desc "TODO"
  task crawling_notice_collect: :environment do
    # 3달 지난 기록 제거
    CrawlingNotice.where(['created_at <= ?', 2.months.ago]).each do |post|
      post.delete
    end
 
    doc = Nokogiri::HTML(open("http://www.kangwon.ac.kr/www/index.do")) # 열고
    @posts = doc.css('#container > section.layer.layer3 > div > section.board > ul > li.active > div > ul > li') #article 클래스를 갖는 객체들을 전부 post에 담아
    @posts.each do |x| #각각 돌면서 Result에 추가해줍니다.
      tit = x.css('a').text
      camp = x.css('span.campus').text
      url = x.css('a').at("a[href]")
      url_swap = url['href']
      @res = CrawlingNotice.new(title: tit, campus: camp, url: url_swap)
      @res.save
    end

  end

end
