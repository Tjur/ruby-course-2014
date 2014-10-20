class Article
	attr_reader :title, :author

	def initialize(title, content, author = "")
	  @title, @content, @author = title, content, author
	  @likes = @dislikes = 0
	  @created_at = Time.now
	end

	def like!
	  @like += 1
	end

	def dislike!
	  @dislike += 1
	end

	def positive_votes
	  @likes - @dislikes
	end

	def votes
	  @likes + @dislikes
	end

	def shortened_to(limit)
	  return @content if limit > @content.size
	  @content[0...limit-3] << "..."
	end

	def include?(pattern)
	  @content.include?(pattern)
	end

	def words
	  @content.split(/\W+/)
	end

	def distinct_words
		words.uniq!
	end
end
