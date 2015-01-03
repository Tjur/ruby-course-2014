require './article.rb'

class ArticleFilesystem
  ARTICLES_FOLDER = "./articles"

  def self.create_file(art)
    Dir.mkdir(ARTICLES_FOLDER) unless Dir.exist?(ARTICLES_FOLDER)
    file = File.new(ARTICLES_FOLDER + "/" + art.title.gsub(/\W+/, "_"), "w")
    file.write("#{art.author}|#{art.title}|#{art.content}|#{art.likes}|#{art.dislikes}")
    file.close
  end

  def self.get_article(path)
    tab = File.open(path, &:readline).split(/\|/)
    art = Article.new(tab[1], tab[2], tab[0])
    tab[3].times { art.like! }
    tab[4].times { art.dislike! }
    art
  end
end