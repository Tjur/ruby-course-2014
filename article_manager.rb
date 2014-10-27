require './article.rb'

class ArticleManager
  def initialize(*articles)
    @articles = articles
  end

  def worst_articles
    @articles.sort_by{ |a| a.positive_votes }
  end

  def best_articles
    worst_articles.reverse
  end

  def worst_article
    worst_articles.first
  end

  def best_article
    best_articles.first
  end

  def most_popular_article
    @articles.sort_by{ |a| a.votes }.last
  end

  def include?(pattern)
    @articles.keep_if{ |a| a.include?(pattern) }
  end

  def authors
    @articles.collect{ |a| a.author }.uniq!
  end

  def number_of_authors
    authors.size
  end

  def votes
    @articles.collect{ |a| a.votes }.reduce(:+)
  end

  def to_s
    @articles.each{ |a| puts "Title: \"#{a.title}\"" }
  end
end
