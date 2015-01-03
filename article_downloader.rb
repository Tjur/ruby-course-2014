require_relative 'article_manager.rb'
require 'openssl'
require 'nokogiri'
require 'open-uri'

class ArticleDownloader

  def self.download(adress = "https://zapisy.ii.uni.wroc.pl/news/?page=", page_number = "1")
    page = Nokogiri::HTML(open(adress + page_number, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}))
    article_manager = ArticleManager.new
    articles = page.css("div.od-news-item")
    articles.each do |art|
      title = art.css('h3').first.text
      content = art.css('div.od-news-body').text.split.join(' ')
      author = art.css('div.od-news-footer').text.split.join(' ')
      created_at = Time.parse(art.css('span.od-news-date').text)

      article_manager.articles.push(Article.new(title, content, author, created_at))
    end
    article_manager
  end
end