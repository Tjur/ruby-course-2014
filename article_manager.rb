require './article.rb'

class ArticleManager
	def initialize(*articles)
	  @articles = articles
	end

	def worst_articles
	  @articles.sort{ |a| a.positive_votes }
	end

	def best_articles
	  @articles.sort{ |a| (-a.positive_votes) }
	end

	def worst_article
	  worst_articles[0]
	end

	def best_article
	  best_articles[0]
	end

	def most_popular_article
	  @articles.collect{ |a| a.votes }.max
	end

	def include?(pattern)
	  @articles.delete_if{ |a| a.include?(pattern) == false }
	end

	def authors
	  @articles.collect{ |a| a.author }.uniq!
	end

	def number_of_authors
	  @articles.authors.size
	end

	def votes
	  @articles.collect{ |a| a.votes }.reduce(:+)
	end

	def to_s
	  @articles.each{ |a| puts "Title: \"#{a.title}\"" }
	end
end
