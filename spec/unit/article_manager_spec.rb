require "./article_manager.rb"

class TestArticleManager < Test::Unit::TestCase

  def setup
    @art1 = Article.new("Harry Potter 1", "Be or not to be, this is the question! Tom has the cat.", "Bruce Willis")
    @art2 = Article.new("Gone with the Wind", "One two three 4 5 six. John lives in a house.", "Margaret Mitchell")
    @art3 = Article.new("To Kill a Mockingbird", "You better make your face up in your favourite disguise!", "Harper Lee")
    @art4 = Article.new("Harry Potter 2", "This is not important", "Bruce Willis")
    @art5 = Article.new("Animal Farm", "There were 3 pigs, 2 chickens, 5 cows, 2 sheeps and one dog", "George Orwell")
    14.times{ @art1.like! }; 8.times{ @art1.dislike! }
    5.times{ @art2.like! }; 9.times{ @art2.dislike! } #worst article
    3.times{ @art3.like! }; 3.times{ @art3.dislike! }
    7.times{ @art4.like! }; 8.times{ @art4.dislike! }
    20.times{ @art5.like! }; 6.times{ @art5.dislike! } #best article
    @manager = ArticleManager.new(@art1, @art2, @art3, @art4, @art5)
  end

  def test_worst_articles
    assert_equal(@manager.worst_articles, [@art2, @art4, @art3, @art1, @art5])
  end

  def test_best_articles
    assert_equal(@manager.best_articles, [@art5, @art1, @art3, @art4, @art2])
  end

  def test_worst_article
    assert_equal(@manager.worst_article, @art2)
  end

  def test_best_article
    assert_equal(@manager.best_article, @art5)
  end

  def test_most_popular_article
    assert_equal(@manager.most_popular_article, @art5)
  end

  def test_include?
    assert_equal(@manager.include?("in"), [@art2, @art3])
    assert_equal(@manager.include?("pancakes"), [])
  end

  def test_authors
    assert_equal(@manager.authors, ["Bruce Willis", "Margaret Mitchell", "Harper Lee", "George Orwell"])
  end

  def test_number_of_authors
    assert_equal(@manager.number_of_authors, 4)
  end

  def test_votes
    assert_equal(@manager.votes, 83)
  end 
end