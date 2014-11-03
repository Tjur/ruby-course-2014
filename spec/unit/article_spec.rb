require_relative "../../article.rb"

class TestArticle < Test::Unit::TestCase

  def setup
    @art = Article.new("Harry Potter", "Be or not to be, this is the question! Tom has the cat.", "Bruce Willis")
  end

  def test_like
    10.times{ @art.like! }
    assert_equal(@art.votes, 10)
  end

  def test_dislike
    3.times{ @art.dislike! }
    assert_equal(@art.votes, 3)
  end

  def test_positive_votes
    15.times{ @art.like! }
    4.times{ @art.dislike! }
    assert_equal(@art.positive_votes, 11)
  end

  def test_shortened_to
    assert_equal(@art.shortened_to(18), "Be or not to be...")
    assert_equal(@art.shortened_to(60), "Be or not to be, this is the question! Tom has the cat.") 
  end

  def test_include?
    assert_equal(@art.include?("question"), true)
    assert_equal(@art.include?("pancakes"), false)
  end

  def test_words
    assert_equal(@art.words, %w[Be or not to be this is the question Tom has the cat])
  end

  def test_distinct_words
    assert_equal(@art.distinct_words, %w[Be or not to be this is the question Tom has cat])
  end

  def test_created_stamp
    assert_equal(@art.created_stamp, @art.created_at.stamp("Sunday, May 1, 2000"))
  end
end